
#  Chef server and Chef packages

In the [previous chapter](../2-chef-cookbook-and-template) we introduced the following Chef elements:
* Chef `nodes`
* `chef-client`
* Chef `resource`
* Chef `recipes`

* `chef-repo`
* Chef `cookbooks`
* Chef `template`
* `Ohai`

And to test-drive it, we used
* VirtualBox
* Vagrant

Here we add :

* the use of a full-blown `chef-repo` holding multiple `cookbooks`
* the user of `Berkshelf` for cookbook dependencies management
* and for local test drive
  * the use of the in memory chef server called `chef-zero` 
  * the use of chef `provisionning` and treat our Vagrant vms as any other Chef resource using `chef/provisioning/vagrant_driver`
* the use of the `package` resource
  * to implement the installation of nginx

## Test Drive it:

Here is how to test Drive it :

    cd chef-repo
    ./chefzero_setup.sh
    
 to rerun/test-it-again
    
    ./chefzero_rerun.sh
    
 to destroy the vm and start from scratch
    
    ./chefzero_destroy.sh
    
You'll have nginx running at http://172.16.0.23