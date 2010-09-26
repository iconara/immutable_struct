# encoding: utf-8

$: << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'spec'
require 'spec/autorun'

require 'immutable_struct'


alias :running :lambda

Spec::Runner.configure do |config|
  
end
