#
# Cookbook Name:: thumbor
# Recipe:: monit
#
# Copyright 2013, Enrico Stahn <mail@enricostahn.com>
# Copyright 2013, Zanui <engineering@zanui.com.au>
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

service 'monit' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

template '/etc/monit/conf.d/nginx_thumbor.monitrc' do
  source 'nginx.monitrc.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[monit]'
  # variables(:server_port => node['nginx']['port'])
end
