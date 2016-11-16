
# https://github.com/agileorbit-cookbooks/java#java_ark
java_ark 'jdk' do
    url node['devopsdays']['java']['jdkurl']
    #checksum node['devopsdays']['java']['jdkchecksum']
    app_home node['devopsdays']['java']['home']
    bin_cmds ['java', 'javac']
    owner node['devopsdays']['user']
    group node['devopsdays']['group']
    action :install
end

# add Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files jars 
remote_file File.join(node['devopsdays']['java']['home'], 'jre/lib/security/local_policy.jar') do
  source node['devopsdays']['java']['local_policy_url']
  mode 0755
  owner node['devopsdays']['user']
  group node['devopsdays']['group']
  action :create # Use to create a file. If a file already exists (but does not match), use to update that file to match.  
end

remote_file File.join(node['devopsdays']['java']['home'], 'jre/lib/security/US_export_policy.jar') do
  source node['devopsdays']['java']['US_export_policy_url']
  mode 0755
  owner node['devopsdays']['user']
  group node['devopsdays']['group']
  action :create # Use to create a file. If a file already exists (but does not match), use to update that file to match.  
end
