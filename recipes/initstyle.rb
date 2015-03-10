#
# Cookbook Name:: thumbor
# Recipe:: initstyle
#
# Author:: Enrico Stahn <mail@enricostahn.com>
#
# Copyright 2012-2015, Zanui <engineering@zanui.com.au>
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

#
# Upstart configuration
#
template '/etc/init/thumbor.conf' do
  source 'thumbor-upstart.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[thumbor]'
  variables(service_config_file: node['thumbor']['service_config_file'])
  only_if { node['thumbor']['init_style'] == 'upstart' }
end

template '/etc/init/thumbor-worker.conf' do
  source 'thumbor-worker-upstart.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
      upstart_respawn: node['thumbor']['upstart_respawn'],
      user: node['thumbor']['user'],
      group: node['thumbor']['group'],
      work_dir: node['thumbor']['work_dir'],
      binary: node['thumbor']['binary'],
      key_file: node['thumbor']['key_file'],
      conf_file: node['thumbor']['conf_file'],
      log_dir: node['thumbor']['log_dir'],
      listen_address: node['thumbor']['listen_address'],
      log_level: node['thumbor']['log_level'],
      filehandle_limit: node['thumbor']['limits']['nofile'],
      process_limit: node['thumbor']['limits']['nproc'],
      memory_limit: node['thumbor']['limits']['memlock']
  )
  notifies :restart, 'service[thumbor]'
  only_if { node['thumbor']['init_style'] == 'upstart' }
end

template node['thumbor']['service_config_file'] do
  source 'thumbor-upstart-config.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[thumbor]'
  variables(
      workers: node['thumbor']['workers'],
      base_port: node['thumbor']['base_port'],
      conf_file: node['thumbor']['conf_file'],
      key_file: node['thumbor']['key_file'],
      listen_address: node['thumbor']['listen_address']
  )
  only_if { node['thumbor']['init_style'] == 'upstart' }
end

directory node['thumbor']['work_dir'] do
  mode '0775'
  owner 'root'
  group 'root'
  action :create
  recursive true
end
