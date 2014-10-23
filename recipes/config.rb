#
# Cookbook Name:: thumbor
# Recipe:: config
#
# Copyright 2014, Virender Khatri
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

# thumbor service user limit
user_ulimit node['thumbor']['user'] do
  filehandle_limit node['thumbor']['limits']['nofile']
  process_limit node['thumbor']['limits']['nproc']
  memory_limit node['thumbor']['limits']['memlock']
end

# thumbor upstart log directory
directory node['thumbor']['log_dir'] do
  recursive true
  notifies :restart, 'service[thumbor]', :delayed if node['thumbor']['notify_restart']
end

# may require different logrotate for different init_style
template '/etc/logrotate.d/thumbor' do
  owner 'root'
  group 'root'
  mode '0755'
  source 'thumbor.logrotate.erb'
end

# thumbor storage directory
directory node['thumbor']['options']['FILE_STORAGE_ROOT_PATH'] do
  owner node['thumbor']['user']
  group node['thumbor']['group']
  mode 0755
  recursive true
  notifies :restart, 'service[thumbor]', :delayed if node['thumbor']['notify_restart']
end

# thumbor result storage directory
directory node['thumbor']['options']['RESULT_STORAGE_FILE_STORAGE_ROOT_PATH'] do
  owner node['thumbor']['user']
  group node['thumbor']['group']
  mode 0755
  recursive true
  notifies :restart, 'service[thumbor]', :delayed if node['thumbor']['notify_restart']
end

ruby_block 'require_pam_limits.so' do
  block do
    fe = Chef::Util::FileEdit.new('/etc/pam.d/su')
    fe.search_file_replace_line(/# session    required   pam_limits.so/, 'session    required   pam_limits.so')
    fe.write_file
  end
end

# thumbor upstart init configuration files
template '/etc/init/thumbor.conf' do
  source 'thumbor.ubuntu.upstart.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[thumbor]', :delayed if node['thumbor']['notify_restart']
  only_if { node['thumbor']['init_style'] == 'upstart' }
end

template '/etc/init/thumbor-worker.conf' do
  source 'thumbor.worker.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[thumbor]', :delayed if node['thumbor']['notify_restart']
  only_if { node['thumbor']['init_style'] == 'upstart' }
end

template '/etc/default/thumbor' do
  source 'thumbor.default.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[thumbor]', :delayed if node['thumbor']['notify_restart']
  variables({ :instances => node['thumbor']['processes'],
              :base_port => node['thumbor']['base_port']
            })
  only_if { node['thumbor']['init_style'] == 'upstart' }
end

# thumbor init.d configuration file
template '/etc/init.d/thumbor' do
  source 'thumbor.init.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[thumbor]', :delayed if node['thumbor']['notify_restart']
  only_if { node['thumbor']['init_style'] == 'initd' }
end

# thumbor key file
file '/etc/thumbor.key' do
  content node['thumbor']['key']
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[thumbor]', :delayed if node['thumbor']['notify_restart']
end

# thumbor configuration file
template '/etc/thumbor.conf' do
  source 'thumbor.conf.default.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[thumbor]', :delayed if node['thumbor']['notify_restart']
  variables({ :options => node['thumbor']['options'] })
end

# thumbor service
service 'thumbor' do
  case node['thumbor']['init_style']
  when 'upstart'
    provider Chef::Provider::Service::Upstart
  else
    provider Chef::Provider::Service::Init
  end
  supports :restart => true, :start => true, :stop => true, :reload => true
  service_name node['thumbor']['service_name']
  action [:enable, :start]
end
