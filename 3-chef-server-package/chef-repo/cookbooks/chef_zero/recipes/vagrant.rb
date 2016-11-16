require 'cheffish'
require 'chef/provisioning/vagrant_driver'

repo_path = "/Users/ledroff/workspace/github/devopsDaysBerlin2016/3-chef-server-package/chef-repo"
vms_dir = File.join(repo_path, 'vagrant_vms')

with_chef_local_server :chef_repo_path => repo_path,
  :cookbook_path => [ File.join(repo_path, 'cookbooks'),
    File.join(repo_path, 'berks-cookbooks') ]

vagrant_box 'CentOS-7-x86_64' do
  url 'http://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-1606_01.VirtualBox.box'
end

with_machine_options :vagrant_options => {
  'vm.box' => 'CentOS-7-x86_64'
}

with_chef_environment 'devopsdaysBerlin2016'


