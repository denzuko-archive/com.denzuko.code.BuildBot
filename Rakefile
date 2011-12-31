require 'rake'
require 'rake/testtask'
require 'rdoc/task'

basedir = File.join(File.dirname(__FILE__),'lib','tasks')
Dir["#{File.join(basedir,'**','*.rake')}"].sort.each { |ext| load ext }

task :default => [:"bot:start"]

desc "Run basic tests"
Rake::TestTask.new("test_units") { |t|
  t.pattern = 'lib/test/*_test.rb'
  t.verbose = true
  t.warning = true
}
