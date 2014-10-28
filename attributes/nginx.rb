#
# Cookbook Name:: thumbor
# Attribute:: nginx
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

# keeping nginx configuration minimal.
# modify attributes for cookbook nginx as per requirement

# disable nginx default vhost
node.default['nginx']['default_site_enabled'] = false
node.default['nginx']['worker_connections'] = '4096'

# nginx thumbor vhost configuration
default['thumbor']['nginx']['port'] = 80
default['thumbor']['nginx']['server_name'] = node['fqdn']
default['thumbor']['nginx']['client_max_body_size'] = '10M'
default['thumbor']['nginx']['proxy_read_timeout'] = '300'
default['thumbor']['nginx']['proxy_cache']['enabled'] = false
default['thumbor']['nginx']['proxy_cache']['path'] = '/var/www/thumbor_cache'
default['thumbor']['nginx']['proxy_cache']['key_zone'] = 'thumbor_cache'
default['thumbor']['nginx']['vhost']['cookbook'] = 'thumbor'
default['thumbor']['nginx']['vhost']['template'] = 'nginx.thumbor.vhost.erb'
default['thumbor']['nginx']['vhost']['variables'] = {}
