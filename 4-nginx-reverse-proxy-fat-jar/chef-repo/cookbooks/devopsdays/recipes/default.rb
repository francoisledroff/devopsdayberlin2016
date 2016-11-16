#
# Cookbook Name:: devopsdays
# Recipe:: default
#
#

case node['platform_family']
when 'rhel' 
  log 'this platform family is supported' do
    level :info
  end
else 
  log 'this platform family is not supported' do
    level :error
  end
end

include_recipe 'devopsdays::user_group'
include_recipe 'devopsdays::iptables'

include_recipe 'devopsdays::home'

include_recipe 'devopsdays::nginx'

include_recipe 'devopsdays::java'