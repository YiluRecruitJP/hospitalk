# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks


require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |task|
  task.libs << 'test'
  task.test_files = FileList['test/*_test.rb']
end

task :default => :test

