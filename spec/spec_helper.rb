require 'simplecov'
require 'coveralls'

formatters = [SimpleCov::Formatter::HTMLFormatter]
formatters << Coveralls::SimpleCov::Formatter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[*formatters]
SimpleCov.start

require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'
