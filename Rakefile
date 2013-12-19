#!/usr/bin/env rake

#
# Copyright 2013, Enrico Stahn <mail@enricostahn.com>
# Copyright 2013, Zanui <engineering@zanui.com.au>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'rubygems'
require 'foodcritic'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

# General tasks

# Rubocop before rspec so we don't lint vendored cookbooks
desc "Run all tests except Kitchen (default task)"
task :unit =>  %w{rubocop foodcritic spec}
task :default => :unit

# Lint the cookbook
desc "Run linters"
task :lint => [ :rubocop, :foodcritic ]

# Run the whole shebang
desc "Run all tests"
task :test => [ :lint, :acceptance ]

# RSpec
desc 'Run chefspec tests'
task :spec do
  puts "Running Chefspec tests"
  RSpec::Core::RakeTask.new(:spec)
end

# Foodcritic
desc 'Run foodcritic lint checks'
task :foodcritic do
  if Gem::Version.new('1.9.2') <= Gem::Version.new(RUBY_VERSION.dup)
    puts "Running Foodcritic tests..."
    FoodCritic::Rake::LintTask.new do |t|
      t.options = {
        :fail_tags => ['any'],
        :include_rules => ['test/foodcritic/customink', 'test/foodcritic/etsy']
      }
    puts "done."    
    end
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end

# Rubocop
desc 'Run Rubocop lint checks'
task :rubocop do
  Rubocop::RakeTask.new
end

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new

  desc "Alias for kitchen:all"
  task :acceptance => "kitchen:all"

rescue LoadError
  puts ">>>>> Kitchen gem not loaded, omitting tasks" unless ENV['CI']
end
