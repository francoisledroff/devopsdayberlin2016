rm Gemfile.lock
bundle install
rm Berksfile.lock
rm -rf berks-cookbooks
berks vendor

# chef-zero chef provisioning deprecated cookbook
#################################################
#
export CHEF_REPO_4=$(pwd)
export CHEF_DRIVER=vagrant
chef-client -z -o  chef_zero

# to destroy your vm and chef associated node and client:
#chef-client -z cookbooks/nc_metal/recipes/destroy_all.rb 

