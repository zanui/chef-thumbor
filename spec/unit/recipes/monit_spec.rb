#
# Cookbook Name:: thumbor
# Recipe:: monit
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

describe 'thumbor::monit' do
  let(:chef_run) { ChefSpec::Runner.new(:platform => 'debian', :version  => '7.0').converge(described_recipe) }

  it 'adds monit configuration file for nginx' do
    expect(chef_run).to render_file('/etc/monit/conf.d/nginx_thumbor.monitrc')
  end

  it 'reloads monit service' do
    template = chef_run.template('/etc/monit/conf.d/nginx_thumbor.monitrc')
    expect(template).to notify('service[monit]').to(:reload)
  end
end
