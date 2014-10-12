#
# Copyright 2013, Enrico Stahn <enrico.stahn@zanui.com.au>
# Copyright 2013, Zanui <engineering@zanui.com.au>
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

default['thumbor']['monit']['enable'] = false

=begin

default['monit']['config']['mail_subject'] = 'monit alert - $EVENT $SERVICE on $HOST'
default['monit']['config']['mail_message'] = <<-EOT
Hello,

Action: Monit $SERVICE $ACTION occured on $HOST.

Time: $DATE.

Reason: $DESCRIPTION.

Yours sincerely,
monit
EOT

default['monit']['config']['subscribers'] = [
  # email notifier
  {
    'name' => 'root@localdomain.local',
    'subscriptions' => %w( nonexist timeout resource icmp connection )
  }
]
=end
