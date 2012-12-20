# encoding: utf-8

$: << File.expand_path('../lib/', __FILE__)

require 'yard'
require 'spec/rake/spectask'
require 'immutable_struct'


task :default => :spec


Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

YARD::Rake::YardocTask.new(:doc)

task :build do
  system 'gem build immutable_struct.gemspec'
end
 
task :release => :build do
  system "gem push immutable_struct-#{ImmutableStruct::VERSION}.gem"
end