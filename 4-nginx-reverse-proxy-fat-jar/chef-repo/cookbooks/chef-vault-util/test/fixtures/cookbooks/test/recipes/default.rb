#
# Cookbook Name:: test
# Recipe:: default

include_recipe 'chef-vault-util::default'

directory '/tmp' do
  owner 'root'
  group 'root'
  mode 0755
  recursive true
  action :create
end

license_properties = chef_vault_item('license', 'cq5_license')
file 'tmp/license.properties' do
  content license_properties['license.properties']
  mode 0755
  owner 'root'
  group 'root'
end
