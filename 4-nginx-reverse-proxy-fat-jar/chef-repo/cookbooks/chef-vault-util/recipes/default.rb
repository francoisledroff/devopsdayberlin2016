chef_gem 'chef-vault' do
  version node['chef-vault']['version']
end
require 'chef-vault'
