# encoding: utf-8

$: << File.expand_path('../lib/', __FILE__)

require 'immutable_struct'


Gem::Specification.new do |s|
  s.name        = 'immutable_struct'
  s.version     = ImmutableStruct::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Theo Hultberg']
  s.email       = ['theo@iconara.net']
  s.homepage    = "http://github.com/iconara/immutable_struct"
  s.summary     = %(A version of Ruby's Struct class that creates classes whose instances are immutable)
  s.description = %(A version of Ruby's Struct class that creates classes whose instances are immutable. It works just as Struct, but there are no setters, and you can't use []=. As a bonus feature the constructor of classes inheriting from ImmutableStruct can take named parameters in the form of a hash.)
 
  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'immutable_struct'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'yard'
 
  s.files        = Dir.glob('{lib}/**/*') + %w(LICENSE README.mdown)
  s.executables  = []
  s.require_path = 'lib'
end
