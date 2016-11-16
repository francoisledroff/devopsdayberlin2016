directory node['devopsdays']['home'] do
  owner node['devopsdays']['user']
  group node['devopsdays']['group']
  mode 0740
  recursive true
  action :create
end

directory node['devopsdays']['builds'] do
  owner node['devopsdays']['user']
  group node['devopsdays']['group']
  mode 0740
  recursive true
  action :create
end

directory node['devopsdays']['logs'] do
  owner node['devopsdays']['user']
group node['devopsdays']['group']
mode 0740
recursive true
action :create
end

directory node['devopsdays']['config'] do
  owner node['devopsdays']['user']
  group node['devopsdays']['group']
  mode 0740
  recursive true
  action :create
end

directory node['devopsdays']['data'] do
  owner node['devopsdays']['user']
  group node['devopsdays']['group']
  mode 0750
  recursive true
  action :create
end

directory node['devopsdays']['ssl_dir'] do
  owner node['devopsdays']['user']
  group node['devopsdays']['group']
  mode 0700
  recursive true
  action :create
end

