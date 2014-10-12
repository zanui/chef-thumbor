#
# Cookbook Name:: thumbor
# Recipe:: monit
#
# Copyright 2013, Enrico Stahn <mail@enricostahn.com>
# Copyright 2013, Zanui <engineering@zanui.com.au>
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "monit-ng"

case node['thumbor']['proxy']
when 'nginx'
  # nginx port check
  monit_check 'nginx' do
    check_id  '/var/run/nginx.pid'
    group     'app'
    start     '/etc/init.d/nginx start'
    stop      '/etc/init.d/nginx stop'
    tests [
      { 'condition' => "failed port #{node['thumbor']['nginx']['port']}", 'action'    => 'restart'}
      # { 'condition' => '3 restarts within 5 cycles', 'action'    => 'alert'}
    ]
  end
end

# thumbor port(s) check
thumbor_checks = []

(node['thumbor']['base_port']..node['thumbor']['base_port'] + node['thumbor']['processes'] - 1).each do |port|
  thumbor_checks.push({ 'condition' => "failed port #{port} protocol http and request '/healthcheck'", 'action' => 'restart' })
end

#thumbor_checks.push({ 'condition' => '3 restarts within 5 cycles', 'action' => 'alert' })

monit_check 'thumbor' do
  check_type  'host'
  id_type     'address'
  check_id    '127.0.0.1'
  group       'app'
  case node['thumbor']['init_style']
  when 'upstart'
    start     '/sbin/start thumbor'
    stop      '/sbin/stop thumbor'
  when 'initd'
    start     '/etc/init.d/thumbor start'
    stop      '/etc/init.d/thumbor stop'
  end

  tests     thumbor_checks
end

