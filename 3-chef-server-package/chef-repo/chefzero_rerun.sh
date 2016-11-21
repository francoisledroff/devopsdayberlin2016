# chef-zero chef provisioning deprecated cookbook
#################################################

export CHEF_REPO_4=$(pwd)
export CHEF_DRIVER=vagrant
chef-client -z -o  chef_zero
