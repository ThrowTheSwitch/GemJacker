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
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "gemjacker"
  gem.homepage = "http://github.com/sw17ch/gemjacker"
  gem.license = "MIT"
  gem.summary = %Q{Manage non-ruby packages with RubyGems}
  gem.description = %Q{Base executable and binary for GemJacker}
  gem.email = "john.vanenk@atomicembedded.com"
  gem.authors = ["John Van Enk"]
  gem.bindir = "bin"
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new
