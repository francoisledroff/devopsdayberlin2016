## create user and group
group node['devopsdays']['group'] do
end

user node['devopsdays']['user'] do
  comment 'devopsdays node user'
  home node['devopsdays']['userhome']
  gid node['devopsdays']['group']
  shell node['devopsdays']['shell']
end

