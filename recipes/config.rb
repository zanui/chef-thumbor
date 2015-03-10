#
# Cookbook Name:: thumbor
# Recipe:: config
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

file '/etc/thumbor.key' do
  content node['thumbor']['key']
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[thumbor]'
end

template '/etc/thumbor.conf' do
  source 'thumbor-config.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[thumbor]'
  variables(options: node['thumbor']['options'])
end

# Create directory structure to store images
directory node['thumbor']['options']['FILE_STORAGE_ROOT_PATH'] do
  owner node['thumbor']['user']
  group node['thumbor']['group']
  mode '0755'
  recursive true
  only_if { node['thumbor']['options']['STORAGE'] == 'thumbor.storages.file_storage' }
end

directory node['thumbor']['options']['RESULT_STORAGE_FILE_STORAGE_ROOT_PATH'] do
  owner node['thumbor']['user']
  group node['thumbor']['group']
  mode '0755'
  recursive true
  only_if { node['thumbor']['options']['STORAGE'] == 'thumbor.storages.file_storage' }
end
