require 'spec_helper'

describe 'example::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  #it 'installs foo' do
  #  expect(chef_run).to install_package('foo')
  #end
end
