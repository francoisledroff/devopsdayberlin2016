#
# Cookbook Name:: motd
# Recipe:: default
#

template '/etc/motd' do
  source 'motd.erb'
  variables(
      :greeter => 'Francois'
  )
end