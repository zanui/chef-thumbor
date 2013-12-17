require 'spec_helper'

describe 'thumbor::default' do
  let(:chef_run) { ChefSpec::Runner.new(:platform => 'debian', :version  => '7.0').converge(described_recipe) }

  it 'installs webp' do
    expect(chef_run).to install_package('webp')
    expect(chef_run).to install_package('libwebp-dev')
  end
end
