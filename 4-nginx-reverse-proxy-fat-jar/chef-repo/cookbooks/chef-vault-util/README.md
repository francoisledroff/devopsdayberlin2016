chef-vault-util
============

A [Chef-Vault](https://github.com/Nordstrom/chef-vault) utility cookbook installing chef-vault and enabling easy testing with a chef_vault_item recipe helper.


Requirements
------------

This cookbook should work on any system/platform that is supported by
Chef.

* Tested with chef 11.4.4, 11.6 and 11.8.2
* tested on CentOS 6.4, RHEL 5.5, RHEL 5.10
* requires the use of **chef-vault** when `dev_mode` is `false`

Attributes
----------

Set this if you need a specific version of chef-vault
    
    default['chef-vault']['version'] = nil

By default dev_mode is set to false:
    
    default['dev_mode']   = false
  
when using chef_vault_item :

* if default['dev_mode'] is false: data will be fetched from chef_vault encrypted data_bags
* if default['dev_mode'] is true: data wil be fetched from plain, clear text data_bags. This is intended to be used only for
  testing, and not as a fall back to avoid issues loading encrypted
  items.

Recipes
----------

only a default recipe

Usage: Helper Method
-------

This cookbook provides a helper method for the Chef Recipe DSL so
you can write:

    chef_vault_item("secrets", "dbpassword")

Instead of:

    ChefVault::Item.load("secrets", "dbpassword")

This has logic to allow for development and testing of recipes, see
__Attributes__ above.


For test code sample, please confer to our kitchen test recipe provided in the recipe :

* [`test/fixtures/cookbooks/test/recipes/default.rb`](test/fixtures/cookbooks/test/recipes/default.rb)
* [`.kitchen.yml`](.kitchen.yml)


License & Authors
==================

This cookbook was inspired/forked from https://github.com/opscode-cookbooks/chef-vault



