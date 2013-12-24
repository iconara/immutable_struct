# encoding: utf-8

$: << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'immutable_struct'
require 'yaml'


alias :running :lambda

RSpec.configure do |config|
  
end
