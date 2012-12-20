# encoding: utf-8

$: << File.expand_path('../lib/', __FILE__)

require 'bundler/setup'
require 'yard'
require 'rspec/core/rake_task'
require 'immutable_struct'


RSpec::Core::RakeTask.new(:spec)

task :default => :spec

YARD::Rake::YardocTask.new(:doc)

task :build => :spec do
  system 'gem build immutable_struct.gemspec'
end
 
task :release => :build do
  system "gem push immutable_struct-#{ImmutableStruct::VERSION}.gem"
end