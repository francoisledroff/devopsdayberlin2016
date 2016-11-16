# Our environments:

Our environments:

* define cookbook versions 
* override our cookbooks attributes (among them the chef-vault encrypted data bags ids) 

we have so far defined:

* `dev` for our local dev using 
  * in in-memory chez-zero server and chef-provisioning 
  * on local vagrant powered CentOs vm

# Tips and Notes

#### commands

A few useful [knife](https://docs.chef.io/knife.html) commands to manage these:

    knife environment from file dev.json
    knife environment from file dev_corp.json
    knife environment show dev

#### tips:

List a node attribute

    knife node show or1010050213180.corp.adobe.com -a dev_mode
     


