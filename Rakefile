require 'foodcritic'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'stove/rake_task'

Stove::RakeTask.new
RuboCop::RakeTask.new
FoodCritic::Rake::LintTask.new do |t|
  t.options = { fail_tags: ['any'] }
end
RSpec::Core::RakeTask.new(:rspec)

desc 'Run tests'
task default: [:rubocop, :foodcritic, :rspec]
