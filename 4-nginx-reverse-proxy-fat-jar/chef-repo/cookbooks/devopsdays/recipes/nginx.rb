

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

template '/usr/share/nginx/html/index.html' do
  source 'index.html.erb'
  variables(
      :greeter => 'Francois'
  )
end

template "/etc/nginx/conf.d/default.conf" do
  source "nginx.default.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, 'service[nginx]', :immediately
end