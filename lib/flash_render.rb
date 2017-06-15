module FlashRender
  def self.included(base)
    # Protect from trying to augment modules that appear
    # as the result of adding other gems.
    return unless base == ActionController::Base

    base.send(:alias_method, :render_without_flash, :render)
    base.send(:alias_method, :render, :render_with_flash)
  end

  def render_with_flash(*args)
    options = args.extract_options!

    if (alert = options.delete(:alert))
      flash.now[:alert] = alert
    end

    if (notice = options.delete(:notice))
      flash.now[:notice] = notice
    end

    if (other_flashes = options.delete(:flash))
      other_flashes.each do |key, value|
        flash.now[key] = value
      end
    end

    args << options
    render_without_flash(*args)
  end
end

if defined?(Rails::Railtie)
  require_relative './flash_render/railtie'
else
  ActionController::Base.include(FlashRender)
end
