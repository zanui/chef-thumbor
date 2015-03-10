#
# Cookbook Name:: thumbor
# Recipe:: repo
# Description:: Add platform specific repositories
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

case node['platform_family']
when 'rhel', 'fedora'

  # yum_repository 'nginx' do
  #   description 'Nginx.org Repository'
  #   baseurl         node['nginx']['upstream_repository']
  #   gpgkey      'http://nginx.org/keys/nginx_signing.key'
  #   action :create
  # end

when 'debian'
  apt_repository 'thumbor' do
    uri node['thumbor']['apt']['thumbor']['uri']
    distribution node['thumbor']['apt']['thumbor']['distribution']
    components node['thumbor']['apt']['thumbor']['components']
    deb_src node['thumbor']['apt']['thumbor']['deb_src']
    keyserver node['thumbor']['apt']['thumbor']['keyserver']
    key node['thumbor']['apt']['thumbor']['key']
    action node['thumbor']['apt']['thumbor']['action']
  end

  apt_repository 'multiverse' do
    uri node['thumbor']['apt']['multiverse']['uri']
    distribution node['thumbor']['apt']['multiverse']['distribution']
    components node['thumbor']['apt']['multiverse']['components']
    deb_src node['thumbor']['apt']['multiverse']['deb_src']
    action node['thumbor']['apt']['multiverse']['action']
  end
end
