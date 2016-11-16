default['apps_dir']   = '/apps'

default['devopsdays']['ssl_dir']    = File.join(node['apps_dir'], '/ssl')
default['devopsdays']['home']    = File.join(node['apps_dir'], '/devopsdays')

default['devopsdays']['builds']  = File.join(node['devopsdays']['home'], 'builds')

default['devopsdays']['logs']    = File.join(node['devopsdays']['home'], 'logs')

default['devopsdays']['config']  = File.join(node['devopsdays']['home'], 'config')
default['devopsdays']['data']  = File.join(node['devopsdays']['home'], 'data')

default['devopsdays']['artifactory_api_key_vault'] = 'corp_artifactory_api_key'
default['devopsdays']['artifactory_base_url'] = 'https://artifactory.corp.adobe.com:443/artifactory/maven-cloud-action-local'
