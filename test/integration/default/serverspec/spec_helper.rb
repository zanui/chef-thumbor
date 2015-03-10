require 'serverspec'
require 'infrataster/rspec'

set :backend, :exec

Infrataster::Server.define(:app, '127.0.0.1')
