require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  #t.libs << "."
  t.libs << "robot_challenge"
  t.test_files = FileList['*_test.rb']
  t.verbose = true
end


