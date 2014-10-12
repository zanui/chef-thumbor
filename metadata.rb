name 'thumbor'
maintainer 'Zanui'
maintainer_email 'engineering@zanui.com.au'
license 'Apache 2.0'
description 'Installs and configures thumbor'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.4.1'

recipe 'thumbor::default', 'Installs/Configures globocom thumbor'
recipe 'thumbor::install', 'Installs thumbor repository and packages'
recipe 'thumbor::config', 'Configures thumbor files and service'
recipe 'thumbor::nginx', 'Install/Configures nginx and thumbor vhost using nginx cookbook'
recipe 'thumbor::redis', 'Install/Configures redis using redisio cookbook'
recipe 'thumbor::monit', 'Install/Configures monit and service check for nginx/thumbor'
recipe 'thumbor::user', 'Setup thumbor service user'

depends 'apt'
depends 'python'
depends 'nginx'
depends 'ulimit'
depends 'monit-ng'
depends 'redisio'

supports 'ubuntu'

attribute 'thumbor/processes',
  :display_name => 'Number of processes',
  :description => 'Number of thumbor processes running in parallel',
  :default => '4'

attribute 'thumbor/base_port',
  :display_name => 'Number of processes',
  :description => 'Number of thumbor processes running in parallel',
  :default => '9000'
