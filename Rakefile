#!/usr/bin/env rake
require 'rake/testtask'
   
Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['test/**/*_spec.rb']
  t.verbose = true
end
   
desc "Runs foodcritic linter"
task :default => :spec
require 'rake/testtask'

RSpec::Core::RakeTask.new
task :foodcritic do
  if Gem::Version.new("1.9.2") <= Gem::Version.new(RUBY_VERSION.dup)
    sh "foodcritic --epic-fail any ."
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end
