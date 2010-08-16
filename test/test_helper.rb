ENV['RAILS_ENV'] = 'test'
require 'dummy/config/environment'
require 'test/unit'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'flash_render'

class Test::Unit::TestCase
end
