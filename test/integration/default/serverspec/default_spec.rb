require 'spec_helper'

describe 'skeleton::default' do

  it 'installs sample package' do
    case RSpec.configuration.os
    when 'Debian'
      expect(package 'vim').to be_installed
    when 'RedHat'
      expect(package 'vim-enhanced').to be_installed
    end
  end

  it 'does something' do
    pending 'Replace this with meaningful tests'
  end
end
