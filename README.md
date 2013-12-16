thumbor Cookbook
================
[![Coverage Status](https://coveralls.io/repos/zanui/chef-thumbor/badge.png)](https://coveralls.io/r/zanui/chef-thumbor)
[![Build Status](https://travis-ci.org/zanui/chef-thumbor.png?branch=master)](https://travis-ci.org/zanui/chef-thumbor)

Installs thumbor from package OR source code and sets up configuration.


Requirements
------------

#### packages
- `apt` - thumbor needs toaster to brown your bagel.

Attributes
----------

#### thumbor::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['thumbor']['processes']</tt></td>
    <td>Integer</td>
    <td>Number of thumbor processes running in parallel</td>
    <td><tt>4</tt></td>
  </tr>
  <tr>
    <td><tt>['thumbor']['base_port']</tt></td>
    <td>Integer</td>
    <td>Base port used to generate the port thumbor processes listen on (e.g. 9000, 9001, ...)</td>
    <td><tt>4</tt></td>
  </tr>
</table>

#### thumbor::source

#### thumbor::monit


Usage
-----
#### thumbor::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `thumbor` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[thumbor]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
- Author:: [Enrico Stahn](https://github.com/estahn) (<enrico.stahn@zanui.com.au>)
- Author:: [Enrico Baioni](https://github.com/ebaioni) (<enrico.baioni@zanui.com.au>)

```text
Copyright:: 2013 Zanui, Internet Services Australia 3 Pty Limited

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
