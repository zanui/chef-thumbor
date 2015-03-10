name 'thumbor'
maintainer 'Zanui'
maintainer_email 'engineering@zanui.com.au'
license 'Apache 2.0'
description 'Installs and configures thumbor'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

recipe 'thumbor::default', 'Installs and configures thumbor'

depends 'apt'
depends 'python'
depends 'nginx'
depends 'monit-ng'
depends 'redisio'
