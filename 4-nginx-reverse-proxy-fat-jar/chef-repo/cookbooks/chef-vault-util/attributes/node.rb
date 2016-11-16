#
# Cookbook Name:: chef-vault-util
# Attributes:: node


# Set this if you need a specific version of chef-vault
default['chef-vault']['version'] = nil

# By default dev_mode is set to false, when using chef_vault_item 
# if false: data will be fetched from chef_vault encrypted data_bags
# if true: data wil be fetched from plain, clear text data_bags
# cf. the kitchen test provided in the recipe

default['dev_mode']   = false


