#
# Cookbook Name:: thumbor
# Recipe:: default
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

# The version is only relevant for install method `pip`. Please check the thumbor
# release page for all available releases or choose any branch name, e.g. master.
#
# Releases: https://github.com/thumbor/thumbor/releases
# Branches: https://github.com/thumbor/thumbor/branches
default['thumbor']['version']      = '4.11.1'

default['thumbor']['package_name'] = 'thumbor'
default['thumbor']['workers']      = node['cpu']['total']
default['thumbor']['base_port']    = 9000
default['thumbor']['key']          = 'secretkey'

# Result storage options:
# - file: Stores the file in the local filesystem
# - s3: Stores the files on AWS S3
default['thumbor']['result_storage'] = 'file'

# Install method options:
# - package: Install thumbor from the globocom package repository
# - pip:  Install thumbor via pip (e.g. default source is GitHub)
default['thumbor']['install_method'] = 'package'

default['thumbor']['source'] = "git+git://github.com/globocom/thumbor.git@#{node['thumbor']['version']}"

default['thumbor']['init_style']     = 'upstart'
default['thumbor']['listen_address'] = '127.0.0.1'

# Install/Configure frontend proxy
# - nginx (default)
# - none
default['thumbor']['proxy']['type'] = 'nginx'

# Enables Monit monitoring and failure resolution for thumbor and Proxy
default['thumbor']['monit']['enable'] = true

# Install/Configure queueing service
# - redis (default)
# - none
default['thumbor']['queue']['type'] = 'redis'
