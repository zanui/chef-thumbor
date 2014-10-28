thumbor Cookbook
================
[![Coverage Status](https://coveralls.io/repos/zanui/chef-thumbor/badge.png)](https://coveralls.io/r/zanui/chef-thumbor)
[![Build Status](https://travis-ci.org/zanui/chef-thumbor.png?branch=master)](https://travis-ci.org/zanui/chef-thumbor)

This is a [Chef] Cookbook to Install and Configure [Thumbor] from pip, package OR source code.


## Recipes

- `thumbor::default`    - default cookbook run_list recipe

- `thumbor::install`  	- install packages required for thumbor

- `thumbor::user`   		- setup user for thumbor service

- `thumbor::config`		  - setup and mange thumbor configuration

- `thumbor::monit`		  - setup monit checks for nginx/thumbor using cookbook `monit-ng`

- `thumbor::nginx`		  - setup and manage frontend proxy nginx for thumbor using cookbook `nginx`

- `thumbor::redis`		  - setup redis for thumbor using cookbook `redisio`

- <del> `thumbor::haproxy`		- setup and mange fronend proxy haproxy for thumbor using cookbook, not completed yet `haproxy`</del>


> For run_list use `recipe[thumbor::default]` or `recipe[thumbor]`


## Cookbook Advanced Attributes

 * `default['thumbor']['proxy']` (default: `nginx`): thumbor service front end proxy, currently only supports nginx

 * `default['thumbor']['storage']['type']` (default: `file`): thumbor storage type

 * `default['thumbor']['init_style']` (default: `upstart`): thumbor service manager, options: initd upstart

 * `default['thumbor']['notify_restart']` (default: `true`): notify thumbor service on a resource change

 * `default['thumbor']['setup_redis']` (default: `true`): whether to setup redis instance using cookbook - redisio

 * `default['thumbor']['setup_user']` (default: `true`): setup user for thumbor service

 * `default['thumbor']['monit']['enable']` (default: `false`): enables monit checks for nginx and thumbor service using monit-ng cookbook

 * <del> `default['thumbor']['queue']['type']` (default: `redis`): thumbor detector queue type, option complete setup not tested yet </del>



## Cookbook Core Attributes

 * `default['thumbor']['version']` (default: `latest): [Thumbor] release version

 * `default['thumbor']['processes']` (default: `node['cpu']['total']`): # of thumbor processes, default utilizes all CPU cores

 * `default['thumbor']['base_port']` (default: `9000`): thumbor service base port to spawn multiple processes

 * `default['thumbor']['key']` (default: ``): thumbor secret key file content

 * <del> `default['thumbor']['log_dir']` (default: `/var/log/thumbor`): thumbor logs directory, not yet tested </del>

 * `default['thumbor']['service_name']` (default: `thumbor`): thumbor service name

 * `default['thumbor']['install_method']` (default: `pip`): thumbor install method

 * `default['thumbor']['listen_address']` (default: `127.0.0.1`): inet for thumbor service, change it with caution

 * `default['thumbor']['binary']` (default: `/usr/local/bin/thumbor`): thumbor binary location for thumbor service

 * `default['thumbor']['upstart_respawn']` (default: `true`): respawn service if goes down

 * `default['thumbor']['conf_file']` (default: `/etc/thumbor.conf`): thumbor configuration file

 * `default['thumbor']['key_file']` (default: `/etc/thumbor.key`): thumbor key file

 * `default['thumbor']['group']` (default: `thumbor`): thumbor service group

 * `default['thumbor']['user']` (default: `thumbor`): thumbor service user

 * `default['thumbor']['user_home']` (default: `nil`): thumbor service user home directory


## Cookbook Repository Attributes

 * `default['thumbor']['apt']['thumbor']['uri']` (default: `http://ppa.launchpad.net/thumbor/ppa/ubuntu`): repo uri

 * `default['thumbor']['apt']['thumbor']['distribution']` (default: `node['lsb']['codename']`): repo distribution

 * `default['thumbor']['apt']['thumbor']['keyserver']` (default: `keyserver.ubuntu.com`): repo keyserver

 * `default['thumbor']['apt']['thumbor']['components']` (default: `[main]`): repo components

 * `default['thumbor']['apt']['thumbor']['key']` (default: `68DFB11CCBEC8F27`): repo key

 * `default['thumbor']['apt']['thumbor']['deb_src']` (default: `false`): whether to fetch source

 * `default['thumbor']['apt']['thumbor']['action']` (default: `add`): apt_repository resource action

 * `default['thumbor']['apt']['multiverse']['uri']` (default: `http://archive.ubuntu.com/ubuntu`): repo uri

 * `default['thumbor']['apt']['multiverse']['distribution']` (default: `node['lsb']['codename']`): repo distribution

 * `default['thumbor']['apt']['multiverse']['keyserver']` (default: `keyserver.ubuntu.com`): repo keyserver

 * `default['thumbor']['apt']['multiverse']['components']` (default: `[main multiverse restricted universe]`): repo components

 * `default['thumbor']['apt']['multiverse']['key']` (default: `40976EAF437D05B5`): repo key

 * `default['thumbor']['apt']['multiverse']['deb_src']` (default: `false`): whether to fetch source

 * `default['thumbor']['apt']['multiverse']['action']` (default: `add`): apt_repository resource action


## Thumbor Service Ulimit Attributes

 * `default['thumbor']['limits']['memlock']` (default: `unlimited`): thumbor service memory limit

 * `default['thumbor']['limits']['nofile']` (default: `48000`): thumbor service file limit

 * `default['thumbor']['limits']['nproc']` (default: `unlimited`): thumbor service proc limit


## Thumbor Nginx Attributes

 * `default['nginx']['default_site_enabled']` (default: `false`): disable default nginx site

 * `default['nginx']['worker_connections']` (default: `4096`): nginx worker connections

 * `default['thumbor']['nginx']['port']` (default: `80`): nginx port

 * `default['thumbor']['nginx']['server_name']` (default: `node['fqdn']`): nginx thumbor vhost server name

 * `default['thumbor']['nginx']['client_max_body_size']` (default: `10M`): nginx thumbor vhost client max body

 * `default['thumbor']['nginx']['proxy_read_timeout']` (default: `300`): nginx thumbor vhost proxy read timeout

 * `default['thumbor']['nginx']['proxy_cache']['enabled']` (default: `false`): enable proxy cache in nginx thumbor vhost

 * `default['thumbor']['nginx']['proxy_cache']['path']` (default: `/var/www/thumbor_cache`): nginx thumbor vhost proxy cache location

 * `default['thumbor']['nginx']['proxy_cache']['key_zone']` (default: `thumbor_cache`): nginx thumbor vhost proxy cache key zone

 * `default['thumbor']['nginx']['vhost']['cookbook']` (default: `thumbor`): nginx thumbor vhost template cookbook name

 * `default['thumbor']['nginx']['vhost']['template']` (default: `nginx.thumbor.vhost.erb`): nginx thumbor vhost template name

 * `default['thumbor']['nginx']['vhost']['variables']` (default: `{}`): nginx thumbor vhost template variables


## Thumbor Default Configuration Attributes

 * `default['thumbor']['options']['ENGINE']` (default: `pil`): thumbor engine

 * `default['thumbor']['options']['QUALITY']` (default: `85`): quality of the generated image

 * `default['thumbor']['options']['MAX_AGE']` (default: ``): client-side cache in seconds

 * `default['thumbor']['options']['MAX_AGE_TEMP_IMAGE']` (default: `0`): client-side caching time for temporary images (using queued detectors or after detection errors)

 * `default['thumbor']['options']['LOADER']` (default: `thumbor.loaders.http_loader`): the way images are to be loaded

 * `default['thumbor']['options']['UPLOAD_ENABLED']` (default: `False`): allow image upload

 * `default['thumbor']['options']['UPLOAD_PHOTO_STORAGE']` (default: `False`): uploaded image storage type

 * `default['thumbor']['options']['RESULT_STORAGE']` (default: `thumbor.result_storages.file_storage`): storage for result image

 * `default['thumbor']['options']['STORAGE']` (default: `thumbor.storages.file_storage`): thumbor storage

 * `default['thumbor']['options']['FILE_STORAGE_ROOT_PATH']` (default: `/var/lib/thumbor/storage`): thumbor file storage location

 * `default['thumbor']['options']['RESULT_STORAGE_FILE_STORAGE_ROOT_PATH']` (default: ``): thumbor result file storage location

 * `default['thumbor']['options']['STORES_CRYPTO_KEY_FOR_EACH_IMAGE']` (default: `True`): stores the crypto key in each image in the storage


 * `default['thumbor']['options']['DETECTORS']` (default: `[]`): thumbor detectors

 * `default['thumbor']['options']['AUTO_WEBP']` (default: `True`): enable auto webp

 * `default['thumbor']['options']['ALLOW_UNSAFE_URL']` (default: `True`): allow unsafe url

 * `default['thumbor']['options']['FILTERS']` (default: `check ::default attribute file`): thumbor filters


## Cookbook Dependencies

* `ulimit`
* `apt`
* `python`
* `nginx`
* `ulimit`
* `monit-ng`
* `redisio`

## AWS OpsWorks
TODO: Write usage instructions


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

- Author:: [Enrico Stahn](https://github.com/estahn) (<enrico.stahn@zanui.com.au>)
- Author:: [Enrico Baioni](https://github.com/ebaioni) (<enrico.baioni@gmail.com>)

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

[Thumbor]:https://github.com/thumbor/thumbor
[Chef]: https://www.getchef.com/chef/
