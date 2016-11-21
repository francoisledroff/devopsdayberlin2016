#  DevopsDays Berlin 2016 `Chef versus Ansible`

This is the github `repo` used for an Hands-On session at DevopsDays Berlin 2016, named [`Chef versus Ansible`](http://www.slideshare.net/francoisledroff/devops-days-berlin2016)

This `repo` was done to demo the `Chef` part. Its introduces the following Chef concepts:

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
  
* the use of a **Chef custom `resource`** named `fat_jar`, 
  * `fat_jar` allows you to treat any given java fat jar (that is runnable jar, typically a `springboot` jar) as a resource, 
    * it assumes the jar is made available through a maven artifact repository
    * it will donwload it
    * it will configure the associated `systemd` service to run it as a service
* the configuration of nginx for it to reverse-proxy a `devopsdays` `fat_jar` http service     


This is done in 4 chapters, look into the subfolders `README.md`