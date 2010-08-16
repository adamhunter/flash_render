require 'test_helper'
#require 'abstract_unit'

class FlashRenderTest < ActionController::TestCase
  class TestController < ActionController::Base
    def render_with_alert
      render :inline => "hello", :alert => "Beware the nowheres!"
    end

    def render_with_notice
      render :inline => "hello", :notice => "Good luck in the somewheres!"
    end

    def render_with_other_flashes
      render :inline => "hello", :flash => { :joyride => "Horses!" }
    end
    
    def rescue_action(e)
      raise unless ActionView::MissingTemplate === e
    end
  end
  
  tests TestController
  
  def setup
    Rails.application.routes.draw do
      match ':action', :to => FlashRenderTest::TestController
    end
    @routes = Rails.application.routes
  end

  def test_render_to_with_alert
    get :render_with_alert
    assert_equal "Beware the nowheres!", @controller.send(:flash)[:alert]
  end

  def test_render_to_with_notice
    get :render_with_notice
    assert_equal "Good luck in the somewheres!", @controller.send(:flash)[:notice]
  end

  def test_render_to_with_other_flashes
    get :render_with_other_flashes
    assert_equal "Horses!", @controller.send(:flash)[:joyride]
  end

end
