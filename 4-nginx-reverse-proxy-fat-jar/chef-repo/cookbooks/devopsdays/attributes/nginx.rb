
case node['platform_family']
when 'rhel', 'fedora'
case node['platform']
  when 'centos'
    # See http://wiki.nginx.org/Install
    default['nginx']['upstream_repository'] = "http://nginx.org/packages/centos/#{node['platform_version'].to_i}/$basearch/"
  when 'amazon'
    default['nginx']['upstream_repository'] = 'http://nginx.org/packages/rhel/6/$basearch/'
  else
    default['nginx']['upstream_repository'] = "http://nginx.org/packages/rhel/#{node['platform_version'].to_i}/$basearch/"
end
when 'debian'
default['nginx']['upstream_repository'] = "http://nginx.org/packages/#{node['platform']}"
end

# pid path as dicdated by the systemd service file at /lib/systemd/system/nginx.service
# cf http://serverfault.com/questions/565339/nginx-fails-to-stop-and-nginx-pid-is-missing
default['nginx']['pid'] = '/run/nginx.pid'
