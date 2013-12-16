require 'spec_helper'

describe 'thumbor::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs webp' do
    expect(chef_run).to install_package('webp')
  end
end
