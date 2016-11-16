
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

        sudo chef-client --local-mode --runlist 'recipe[motd]'
        
        
# Misc Notes

Note I generated the cookbooks skelelton using the command :
                
        mkdir cookbooks
        chef generate cookbook cookbooks/motd
                