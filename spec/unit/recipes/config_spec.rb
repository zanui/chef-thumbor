#
# Cookbook Name:: thumbor
# Recipe:: config
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

require 'spec_helper'

describe 'thumbor::config' do
  let(:chef_run) { ChefSpec::Runner.new(:platform => 'debian', :version  => '7.0').converge(described_recipe) }

  it 'adds thumbor configuration file' do
    expect(chef_run).to render_file('/etc/thumbor.conf')
  end

  it 'adds init thumbor worker configuration file' do
    expect(chef_run).to render_file('/etc/init/thumbor-worker.conf')
  end

  it 'adds init thumbor configuration file' do
    expect(chef_run).to render_file('/etc/init/thumbor.conf')
  end

  it 'adds thumbor key configuration file' do
    expect(chef_run).to render_file('/etc/thumbor.key')
  end

end
