#
# Cookbook Name:: thumbor
# Recipe:: user
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

# NEED TO CHECK IF user_home directory resource needs to call first

group node['thumbor']['group'] do
  action :create
  only_if { node['thumbor']['setup_user'] }
end

user node['thumbor']['user'] do
  home    node['thumbor']['user_home'] if node['thumbor']['user_home']
  shell   "/bin/bash"
  gid     node['thumbor']['group']
  action  :create
  only_if { node['thumbor']['setup_user'] }
end

