require 'rake/testtask'

desc 'Run tests'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/tc_*.rb'
  t.verbose = true
end

task :default => :test
