module FlashRender

  def self.included(base)
    # Protect from trying to augment modules that appear
    # as the result of adding other gems.
    return if base != ActionController::Base

    base.class_eval do
      alias_method_chain :render, :flash
    end
  end

  def render_with_flash(*args)
    options = args.extract_options!
  
    if alert = options.delete(:alert)
      flash.now[:alert] = alert
    end
  
    if notice = options.delete(:notice)
      flash.now[:notice] = notice
    end
  
    if other_flashes = options.delete(:flash)
      other_flashes.each do |key, value|
        flash.now[key] = value
      end
    end
  
    args << options
    render_without_flash(*args)
  end
end

if defined?(Rails::Railtie)
  require 'flash_render/railtie'
else
  ActionController::Base.send :include, FlashRender
end
