

yum_repository 'nginx' do
  description 'Nginx.org Repository'
  baseurl      node['nginx']['upstream_repository']
  gpgkey      'http://nginx.org/keys/nginx_signing.key'
  action :create
end

package 'nginx'

service 'nginx' do
  action [:start]
  supports [:status, :start, :stop, :restart]
end

