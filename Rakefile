# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "activemodel_unique_errors"
  gem.homepage = "http://github.com/soemo/activemodel_unique_errors"
  gem.license = "MIT"
  gem.summary = %Q{Uniqe model errors}
  gem.description = %Q{Only add a error messages for one model attribute if this error message not exists for the model attribute}
  gem.email = "soeren@mothes.org"
  gem.authors = ["soeren mothes"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end


task :default => :spec
