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

default['thumbor']['service_config_file'] = case node['platform_family']
                                            when 'rhel'
                                              '/etc/sysconfig/thumbor'
                                            else
                                              '/etc/default/thumbor'
                                            end

default['thumbor']['work_dir'] = '/var/lib/thumbor'
default['thumbor']['binary'] = case node['thumbor']['install_method']
                               when 'package'
                                 '/usr/bin/thumbor'
                               else
                                 '/usr/local/bin/thumbor'
                               end

# Process limits
default['thumbor']['limits']['memlock'] = 'unlimited'
default['thumbor']['limits']['nofile']  = 48_000
default['thumbor']['limits']['nproc']   = 'unlimited'

default['thumbor']['log_level'] = 'warning'
default['thumbor']['log_dir'] = '/var/log/thumbor'
default['thumbor']['logrotate']['rotate'] = 7
