thumbor Cookbook
================
[![Cookbook](https://img.shields.io/cookbook/v/thumbor.svg)](https://supermarket.chef.io/cookbooks/thumbor)
[![Coverage Status](https://img.shields.io/coveralls/zanui/chef-thumbor.svg)](https://coveralls.io/r/zanui/chef-thumbor)
[![Build Status](https://img.shields.io/travis/zanui/chef-thumbor.svg)](https://travis-ci.org/zanui/chef-thumbor)

Installs/configures [thumbor](https://github.com/thumbor/thumbor) - an open-source photo thumbnail service by globo.com

> **NOTE**: This cookbook has been heavily refactored. Please read the CHANGELOG.

Features
------------
* Install packages for engines `pil`, `opencv`, `graphicsmagick`, `gifsicle`
* Install methods `package`, `source`, `pip`
* Support image format WEBP
* Support Storage AWS S3
* ServerSpec/Infrataster Tests
* [thumbor Stack on AWS OpsWorks in 10 minutes](https://github.com/zanui/chef-thumbor/wiki/thumbor-Stack-on-AWS-OpsWorks-in-10-minutes)

Requirements
------------

## Platform:

* Ubuntu (>= 12.04)

## Cookbooks:

- `apt` - Configures apt and apt services and LWRPs for managing apt repositories and preferences
- `python` - Installs Python, pip and virtualenv.
- `nginx` - Installs and configures nginx
- `monit-ng` - Installs and configures monit
- `redisio` - Installs/Configures redis

Attributes
----------
The list of attributes found in the documentation is just an overview of important attributes.
Please look through the `attributes` directory in order to find attributes that may not be listed here.

#### thumbor::default
  <table>
    <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node['thumbor']['version']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt>4.11.1</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['workers']</tt></td>
    <td>Integer</td>
    <td></td>
    <td><tt>node['cpu']['total']</tt></td>
  </tr>
  </table>

#### thumbor::config
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node['thumbor']['conf_file']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt>/etc/thumbor.conf</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['key_file']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt>/etc/thumbor.key</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"{ ... }"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['QUALITY']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"85"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['MAX_AGE']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"24 * 60 * 60"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['MAX_AGE_TEMP_IMAGE']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"0"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['ALLOW_UNSAFE_URL']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"true"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['LOADER']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"thumbor.loaders.http_loader"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['UPLOAD_ENABLED']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"false"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['UPLOAD_PHOTO_STORAGE']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"false"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['STORAGE']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"thumbor.storages.no_storage"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['FILE_STORAGE_ROOT_PATH']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"/var/lib/thumbor/storage"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['RESULT_STORAGE_FILE_STORAGE_ROOT_PATH']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"/var/lib/thumbor/result-storage"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['RESULT_STORAGE_STORES_UNSAFE']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"false"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['STORES_CRYPTO_KEY_FOR_EACH_IMAGE']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"true"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['ENGINE']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"thumbor.engines.pil"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['DETECTORS']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"[ ... ]"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['REDIS_QUEUE_SERVER_HOST']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"127.0.0.1"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['REDIS_QUEUE_SERVER_PORT']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"6379"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['REDIS_QUEUE_SERVER_DB']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"0"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['REDIS_QUEUE_SERVER_PASSWORD']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"None"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['AUTO_WEBP']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"true"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['options']['FILTERS']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"[ ... ]"`.</tt></td>
  </tr>
  </table>
  
#### thumbor::initstyle
  <table>
    <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node['thumbor']['version']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"4.11.1"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['package_name']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"thumbor"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['workers']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"node['cpu']['total']"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['base_port']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"9000"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['key']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"secretkey"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['result_storage']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"file"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['install_method']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"pip"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['source']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"git+git://github.com/globocom/thumbor.git@\#{node['thumbor']['version']}"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['init_style']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"upstart"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['listen_address']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"127.0.0.1"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['proxy']['type']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"nginx"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['monit']['enable']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"true"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['queue']['type']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"none"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['pip_dependencies']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"[ ... ]"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['package_dependencies']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"%w(cmake git)"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['package_dependencies'] +</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"%w(python-pgmagick python-pycurl)"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['service_config_file']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"case node['platform_family']"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['work_dir']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"/var/lib/thumbor"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['binary']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"case node['thumbor']['install_method']"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['limits']['memlock']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"unlimited"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['limits']['nofile']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"48_000"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['limits']['nproc']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"unlimited"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['log_level']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"warning"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['log_dir']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"/var/log/thumbor"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['logrotate']['rotate']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"7"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['nginx']['port']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"81"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['nginx']['server_name']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"_"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['nginx']['client_max_body_size']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"10M"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['nginx']['proxy_read_timeout']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"300"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['nginx']['proxy_cache']['enabled']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"false"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['nginx']['proxy_cache']['path']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"/var/www/thumbor_cache"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['nginx']['proxy_cache']['key_zone']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"thumbor_cache"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['nginx']['proxy_cache']['valid']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"900s"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['nginx']['vhost']['cookbook']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"thumbor"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['nginx']['vhost']['template']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"nginx.vhost.erb"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['nginx']['vhost']['variables']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"{ ... }"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['thumbor']['uri']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"http://ppa.launchpad.net/thumbor/ppa/ubuntu"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['thumbor']['keyserver']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"keyserver.ubuntu.com"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['thumbor']['components']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"%w(main)"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['thumbor']['key']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"68DFB11CCBEC8F27"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['thumbor']['deb_src']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"false"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['thumbor']['action']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"add"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['multiverse']['uri']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"http://archive.ubuntu.com/ubuntu"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['multiverse']['distribution']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"node['lsb']['codename']"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['multiverse']['keyserver']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"keyserver.ubuntu.com"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['multiverse']['components']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"%w(main multiverse restricted universe)"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['multiverse']['key']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"40976EAF437D05B5"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['multiverse']['deb_src']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"false"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['multiverse']['action']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"add"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['apt']['thumbor']['distribution']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"node['lsb']['codename']"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['user']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"thumbor"`.</tt></td>
  </tr>
  <tr>
    <td><tt>node['thumbor']['group']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>Defaults to `"thumbor"`.</tt></td>
  </tr>
</table>

Usage
-----
#### thumbor::default

Simple:
```json
{
  "name":"my_node",
  "run_list": [
    "recipe[thumbor]"
  ]
}
```

Generate a secret and disable unsafe-mode:
```json
{
  "name":"my_node",
  "run_list": [
    "recipe[thumbor]"
  ],
  "default_attributes": {
    "thumbor": {
      "key": "This-Is-A-Secret-Key",
      "options": {
        "ALLOW_UNSAFE_URL": false
      }
    }
  }
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