maintainer       'Francois Le Droff'
maintainer_email 'ledroff@adobe.com'
license          'Apache 2.0'
name             'devopsdays'
description      'Installs/Configures devopsdays demo'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
## use sprint as minor versions and eventually suffix it with the jira entry
version          '1.0.0'

recipe 'devopsdays::default', 'Installs and configure a demo'

supports 'centos'

## local repo cookbooks
depends 'chef-vault-util', '=1.0.2'

## community cookbooks declared with Berkshelf
depends 'java'
depends 'chef-client'
depends 'hostsfile'
depends 'selinux', '~> 0.9.0'



