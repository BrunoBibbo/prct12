$:.unshift File.dirname(__FILE__) + 'lib'
$:.unshift './lib', './spec'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
 
RSpec::Core::RakeTask.new
task :default => :spec


desc "Pruebas unitarias"

task :test do
        sh "ruby -I ./lib test/Matriz_test.rb"
end

