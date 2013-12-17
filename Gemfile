source 'https://rubygems.org'

gem 'strainer'
gem 'berkshelf',  '~> 2.0'
gem 'chefspec',   '~> 3.0'
gem 'fauxhai'
gem 'foodcritic', '~> 3.0'
gem 'rubocop',    '~> 0.15'
gem 'rake'

group :integration do
  gem 'test-kitchen'
  gem 'kitchen-vagrant'
  gem 'kitchen-docker'
end

group :test do
  gem 'coveralls', require: false
end

group :development do
  gem 'chef'
  gem 'knife-spork', '~> 1.0.17'
  gem 'knife-spec'
end
