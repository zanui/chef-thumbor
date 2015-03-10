#
# Cookbook Name:: thumbor
# Recipe:: repo
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

default['thumbor']['apt']['thumbor']['uri'] = 'http://ppa.launchpad.net/thumbor/ppa/ubuntu'
default['thumbor']['apt']['thumbor']['keyserver'] = 'keyserver.ubuntu.com'
default['thumbor']['apt']['thumbor']['components'] = %w(main)
default['thumbor']['apt']['thumbor']['key'] = '68DFB11CCBEC8F27'
default['thumbor']['apt']['thumbor']['deb_src'] = false
default['thumbor']['apt']['thumbor']['action'] = 'add'

default['thumbor']['apt']['multiverse']['uri'] = 'http://archive.ubuntu.com/ubuntu'
default['thumbor']['apt']['multiverse']['distribution'] = node['lsb']['codename']
default['thumbor']['apt']['multiverse']['keyserver'] = 'keyserver.ubuntu.com'
default['thumbor']['apt']['multiverse']['components'] = %w(main multiverse restricted universe)
default['thumbor']['apt']['multiverse']['key'] = '40976EAF437D05B5'
default['thumbor']['apt']['multiverse']['deb_src'] = false
default['thumbor']['apt']['multiverse']['action'] = 'add'

case node['platform_version']
when '14.04'
  default['thumbor']['apt']['thumbor']['distribution'] = 'saucy'
else
  default['thumbor']['apt']['thumbor']['distribution'] = node['lsb']['codename']
end
