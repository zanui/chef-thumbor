# encoding: UTF-8

require 'minitest/spec'

describe_recipe 'thumbor::default' do
  it 'creates a file called capers' do
    file('/home').must_exist
  end
end
