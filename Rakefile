require 'rubygems'
require 'rake'


begin
  require 'lib/immutable_struct'
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'immutable_struct'
    gem.summary = %Q{An immutable version of Ruby's Struct class}
    gem.description = %Q{An immutable implementation of Ruby's `Struct` class. It works just as Struct, but there are no setters, and you can't use `[]=`. As a bonus feature the constructor of classes inheriting from ImmutableStruct can take named parameters in the form of a hash.}
    gem.email = 'theo@iconara.net'
    gem.homepage = 'http://github.com/iconara/immutable_struct'
    gem.authors = ['Theo Hultberg']
    gem.add_development_dependency 'rspec', '>= 1.2.9'
    gem.add_development_dependency 'yard', '>= 0'
    gem.version = ImmutableStruct::VERSION
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort 'YARD is not available. In order to run yardoc, you must: sudo gem install yard'
  end
end
