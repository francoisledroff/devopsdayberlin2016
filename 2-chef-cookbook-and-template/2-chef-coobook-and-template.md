
#  Vagrant

Running a simple basic `CentOS-6.4-x86_64` image

    cat Vagrantfile 

    vagrant up
    vagrant ssh

# Install Chef-dk on the vm

    curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v 0.18.30

# Create cookbook

Set up your working directory    

        mkdir ~/chef-repo
        cd  ~/chef-repo
        
        cp -rf /vagrant/chef-repo/cookbooks ~/chef-repo/cookbooks
        
                
# Apply cookbook

check the recipe and the associated template:

        cat cookbooks/motd/recipes/default.rb 
        cat cookbooks/motd/templates/default/motd.erb 

test it:

        sudo chef-client --local-mode --runlist 'recipe[motd]'
        
        
# Misc Notes

Note I generated the cookbooks skelelton using the command :
                
        mkdir cookbooks
        chef generate cookbook cookbooks/motd
                
OOhai is Chef’s system profiler. When run, Ohai will introduce you to your system, telling you most everything 
you could possibly want to know about it. And if it’s missing some key fact? 
Ohai takes plugins, so you can easily extend it to gather more information.
The best part is that you can distribute these Ohai plugins with Chef itself! 
Ohai can be run stand-alone, but it’s primarily intended to run as part of the chef-client.

Let’s try running Ohai by itself. 
        
        ohai | more
