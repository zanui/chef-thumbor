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

require 'spec_helper'

# Ugly to place it here, but the only way to pass Rubocop for now.
node = ::JSON.parse(File.read('/tmp/serverspec/node.json'))

describe ppa('thumbor/ppa') do
  if node['thumbor']['install_method'] == 'package'
    it { should exist }
    it { should be_enabled }
  else
    it { should_not exist }
    it { should_not be_enabled }
  end
end

describe package('thumbor') do
  if node['thumbor']['install_method'] == 'package'
    it { should be_installed }
  else
    it { should_not be_installed }
  end
end
