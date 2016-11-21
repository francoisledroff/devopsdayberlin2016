
#  Chef server and Chef packages

In the [previous chapter](../3-chef-server-package) we introduced the following Chef elements:
* Chef `nodes`
* `chef-client`
* Chef `resource`
* Chef `recipes`

* `chef-repo`
* Chef `cookbooks`
* Chef `template`
* `Ohai`

* the use of a full-blown `chef-repo` holding multiple `cookbooks`
* the user of `Berkshelf` for cookbook dependencies management
* and for local test drive
  * the use of the in memory chef server called `chef-zero` 
  * the use of chef `provisionning` and treat our Vagrant vms as any other Chef resource using `chef/provisioning/vagrant_driver`
* the use of the `package` resource
  * to implement the installation of nginx
  
Here we add:

* the use of our **Chef custom `resource`** named `fat_jar`, 
  * `fat_jar` allows you to treat any given java fat jar (that is runnable jar, typically a `springboot` jar) as a resource, 
    * it assumes the jar is made available through a maven artifact repository
    * it will donwload it
    * it will configure the associated `systemd` service to run it as a service
* the configuration of nginx for it to reverse-proxy a `devopsdays` `fat_jar` http service     
 

## Test Drive it:

Here is how to test Drive it :

* First have an `artifactory` server running on your `localhost` on port `9081` 
  ** and have it served the `pom.xml` and `jar` of our sample java project: cf https://github.com/francoisledroff/devopsdayBerlin2016JavaApp

Then 

    cd chef-repo
    ./chefzero_setup.sh
    
 to rerun/test-it-again
    
    ./chefzero_rerun.sh
    
 to destroy the vm and start from scratch
    
    ./chefzero_destroy.sh
    
    
You'll have nginx running at http://172.16.0.24 and reverse proxying the `devopsdays` `fat_jar` http service  at  http://172.16.0.24/api