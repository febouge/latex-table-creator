require 'rake/testtask'

desc 'Run tests'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/tc_*.rb'
  t.verbose = true
end
