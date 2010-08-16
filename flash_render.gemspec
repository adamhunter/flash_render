# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'flash_render/version'

Gem::Specification.new do |s|
  s.name        = "flash_render"
  s.version     = FlashRender::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Adam Hunter', 'Sean']
  s.email       = ['adamhunter@me.com']
  s.homepage    = "http://rubygems.org/gems/flash_render"
  s.summary     = "Updates render to use flashes like redirect_to"
  s.description = "Inspired by 'Sean' at http://bit.ly/flash_render I use the `flash.now[:alert] and render` pattern all the time and wanted an easy way to share it with my apps."
  s.add_dependency 'rails', '>= 2.3.8'
  s.add_development_dependency 'redgreen'

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "flash_render"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.5"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'
end