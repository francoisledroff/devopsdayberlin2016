#  Chef 101

Here we showcase/introduce the following Chef elements:
* Chef `nodes`
* `chef-client`
* Chef `resource`
* Chef `recipes`

And to test-drive it, we use/showcase
* VirtualBox
* Vagrant

#  Chef 101 Test drive

## Install VirtualBox

    VBoxManage --version

        5.0.10r104061


Oracle VM VirtualBox is a free and open-source hypervisor for x86 computers from Oracle Corporation. Developed initially by Innotek GmbH, it was acquired by Sun Microsystems in 2008 which was in turn acquired by Oracle in 2010.

## Install Vagrant

    vagrant --version

        Vagrant 1.7.4

Vagrant is an open-source software product for building and maintaining portable virtual development environments. 


## my VagrantFile

Running a simple basic `CentOS-6.4-x86_64` image

    cat Vagrantfile 

    vagrant up
    vagrant ssh

## Install Chef-dk on the vm

    curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v 0.18.30

## motd

Set up your working directory    

        mkdir ~/chef-repo
        cd  ~/chef-repo
        
        cp -rf /vagrant/chef-repo/motd.rb ~/chef-repo/motd.rb
        
 ou à la main
        
        touch motd.rb
        vi motd.rb
        
 edit with
 
    file '/etc/motd' do
        content 'hello from Francois'
    end

From your terminal window, run the following chef-client command to apply what you've written.

    sudo chef-client --local-mode motd.rb

idempotence
  
    sudo chef-client --local-mode motd.rb     

Ensure the MOTD file's contents are not changed by anyone else

You need to make sure that no other process can change the MOTD.
Imagine that a co-worker manually changes `/tmp/motd` by replacing 'hello chef' with 'hello robots'. Go ahead and change your copy of /tmp/motd through your text editor. Or you can change the file from the command line like this.

    echo 'hello from Romain' > /tmp/motd

    sudo chef-client --local-mode motd.rb

In practice, you'll have chef-client installed as a service running periodically or as part of a continuous delivery system

