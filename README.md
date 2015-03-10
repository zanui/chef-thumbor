thumbor Cookbook
================
[![Cookbook](https://img.shields.io/cookbook/v/thumbor.svg)](https://supermarket.chef.io/cookbooks/thumbor)
[![Coverage Status](https://coveralls.io/repos/zanui/chef-thumbor/badge.png)](https://coveralls.io/r/zanui/chef-thumbor)
[![Build Status](https://travis-ci.org/zanui/chef-thumbor.png?branch=master)](https://travis-ci.org/zanui/chef-thumbor)

Installs/configures [thumbor](https://github.com/thumbor/thumbor) - an open-source photo thumbnail service by globo.com

> **NOTE**: This cookbook has been heavily refactored. Please read the CHANGELOG.

Features
------------
* Install packages for engines `pil`, `opencv`, `graphicsmagick`, `gifsicle`
* Install methods `package`, `source`, `pip`
* Support image format WEBP
* Support Storage AWS S3
* ServerSpec/Infrataster Tests

Requirements
------------

### Cookbooks
- `apt` - Configures apt and apt services and LWRPs for managing apt repositories and preferences
- `python` - Installs Python, pip and virtualenv.
- `nginx` - Installs and configures nginx
- `monit-ng` - Installs and configures monit
- `redisio` - Installs/Configures redis


Attributes
----------
The list of attributes found in the documentation is just an overview of important attributes. Please look through the `attributes` directory in order to find attributes that may not be listed here.  

#### thumbor::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['thumbor']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

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

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

### Prerequisites

- [ChefDK](http://downloads.getchef.com/chef-dk/ "ChefDK")
- Recent RuboCop
  
  ```
  chef gem install rubocop
  ```

### Testing

Test changes using

```
chef exec rake
chef exec kitchen verify
```

License and Authors
-------------------
Author:: Enrico Stahn (mail@enricostahn.com)

Copyright 2015, Zanui

See LICENSE for license details