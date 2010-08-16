require 'flash_render'
require 'rails'

module FlashRender
  class Railtie < ::Rails::Railtie
    initializer "flash_render.add_to_action_controller" do
      ActionController::Base.send :include, FlashRender
    end
  end
end