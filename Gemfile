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

source 'https://rubygems.org'

gem 'rake'

group :test do
  gem 'foodcritic'
  gem 'rubocop'
  gem 'serverspec'
  gem 'infrataster'
end

group :integration do
  gem 'berkshelf'
  gem 'test-kitchen'
  gem 'kitchen-vagrant'
end

group :releasing do
  gem 'stove'
end
