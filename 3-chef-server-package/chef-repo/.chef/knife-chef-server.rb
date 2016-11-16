current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "your_node_name"
client_key               "#{current_dir}/your_user.pem"
validation_client_name   "cloud_actions-validator"
validation_key           "#{current_dir}/your_chef_org.pem"
chef_server_url          "https://your.chef.server/organizations/your_chef_org"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
# https://github.com/matschaffer/knife-solo/pull/308
chef_repo_path           "."
knife[:editor] = "/usr/local/bin/subl -w"