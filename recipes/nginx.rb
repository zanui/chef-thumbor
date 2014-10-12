#
# Cookbook Name:: thumbor
# Recipe:: nginx
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

include_recipe "nginx"

# nginx proxy cache location
directory node['thumbor']['nginx']['proxy_cache']['path'] do
  owner     node['nginx']['user']
  group     node['nginx']['group']
  mode      '0700'
  action    :create
  recursive true
  only_if   do node['thumbor']['nginx']['proxy_cache']['enabled'] end
end

# nginx thumbor vhost configuration file
template '/etc/nginx/sites-available/thumbor' do
  cookbook  node['thumbor']['nginx']['vhost']['cookbook']
  source    node['thumbor']['nginx']['vhost']['template']
  owner     node['nginx']['user']
  group     node['nginx']['group']
  mode      '0644'
  notifies  :restart, 'service[nginx]', :delayed if node['thumbor']['notify_restart']
  variables ( node['thumbor']['nginx']['vhost']['variables'].empty? ? {
    :instances            => node['thumbor']['processes'],
    :base_port            => node['thumbor']['base_port'],
    :server_port          => node['thumbor']['nginx']['port'],
    :server_name          => node['thumbor']['nginx']['server_name'],
    :client_max_body_size => node['thumbor']['nginx']['client_max_body_size'],
    :proxy_read_timeout   => node['thumbor']['nginx']['proxy_read_timeout'],
    :proxy_cache_enabled  => node['thumbor']['nginx']['proxy_cache']['enabled'],
    :proxy_cache_path     => node['thumbor']['nginx']['proxy_cache']['path'],
    :proxy_cache_key_zone => node['thumbor']['nginx']['proxy_cache']['key_zone']
  } : node['thumbor']['nginx']['vhost']['variables'])
end

nginx_site "thumbor" do
  enable true
end
