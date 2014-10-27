#
# Cookbook Name:: thumbor
# Attribute:: redis
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

# keeping redis configuration minimal.
# modify attributes for cookbook redisio as per requirement

# setup local redis server
default['thumbor']['setup_redis']  = false

node.default['redisio']['version'] = '2.8.17'

# disabled as redis queued redis detector is not
# configured by default
# Redis parameters for queued detectors
# default['thumbor']['options']['REDIS_QUEUE_SERVER_HOST'] = 'localhost'
# default['thumbor']['options']['REDIS_QUEUE_SERVER_PORT'] = 6379
# default['thumbor']['options']['REDIS_QUEUE_SERVER_DB'] = 0
# default['thumbor']['options']['REDIS_QUEUE_SERVER_PASSWORD'] = 'None'
