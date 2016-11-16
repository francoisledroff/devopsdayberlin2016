require 'chef/provisioning'

machine 'devopsdays' do
  tag 'devopsdays'
  #recipe 'chef-client::default'
  recipe 'devopsdays::default'
  chef_environment 'dev'
  converge true
  complete true
  # https://github.com/opscode/chef-metal/issues/95
  add_machine_options :vagrant_config => <<-EOM
      config.vm.network "private_network", ip: "192.168.0.23"
      config.vm.provider 'virtualbox' do |v|
             v.customize [
               "modifyvm", :id,
               "--memory", "4096"
             ]
      end   
      EOM
end
