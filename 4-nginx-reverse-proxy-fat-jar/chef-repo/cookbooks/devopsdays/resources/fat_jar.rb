resource_name :fat_jar

property :artifactId, String, required: true
property :groupIdPath, String,  default: 'com/ledroff'
property :description, String, name_property: true
property :version, String, default: '1.0.0'
property :javaOpts, String, default: '-Xms1024m -Xmx2048m -XX:MaxPermSize=256m'
property :progArgs, String, default: '--spring.profiles.active=dev'

property :user, String, default: node['devopsdays']['user']
property :group, String, default: node['devopsdays']['group']

action :create do

  p serviceName = artifactId
  p servicePath = "/lib/systemd/system/"+serviceName+".service"

  p jarFolder = Chef::File.join(node['devopsdays']['home'], artifactId)
  p jarPath= Chef::File.join(jarFolder, '/'+artifactId+'.jar')

  p pomFolder = node['devopsdays']['builds']
  p pomPath = Chef::File.join(pomFolder, '/'+artifactId+'.pom.xml')
  p formerPomPath = Chef::File.join(pomFolder, '/'+artifactId+'.former.pom.xml')

  p jarUrl = node['devopsdays']['artifactory_base_url'] +  "/" + groupIdPath + "/" + artifactId + "/" +version+"/"+artifactId+"-"+version+".jar"
  p pomUrl = node['devopsdays']['artifactory_base_url'] +  "/" + groupIdPath + "/" + artifactId + "/" +version+"/"+artifactId+"-"+version+".pom"

  directory jarFolder do
    owner user
    group group
    mode 0755
    recursive true
    action :create
  end

  execute 'curl '+artifactId+' jar from artifactory' do
    command "curl --globoff -o  #{pomPath}  #{pomUrl}"
    cwd jarFolder
    user user
    group group
  end

  execute 'curl '+artifactId+' jar from artifactory' do
    command "curl --globoff -o #{jarPath} #{jarUrl}"
    cwd jarFolder
    user user
    group group
    not_if "diff -q #{pomPath} #{formerPomPath} && [ -f #{formerPomPath} ] "
  end

  execute 'chmod '+artifactId+' jar' do
    command "chmod 700  #{jarPath}"
    cwd jarFolder
    user user
    group group
    not_if "diff -q #{pomPath} #{formerPomPath} && [ -f #{formerPomPath} ] "
  end

  template servicePath do
    source 'fat_jar.service.erb'
    variables(
        :user => user,
        :serviceDescription => description + ' Service',
        :javaOpts => javaOpts,
        :jarPath => jarPath,
        :progArgs => progArgs
    )
    owner 'root'
    group 'root'
    mode 0644
    notifies :run, 'execute[daemon-reload]', :immediately
    notifies :restart, 'service['+serviceName+']', :delayed
  end

# service changed on disk. Running systemctl daemon-reload to reload units
  execute 'daemon-reload' do
    command 'systemctl daemon-reload'
    user 'root'
    group 'root'
    action [:nothing]
  end

  service serviceName do
    action [:nothing]
    supports [:status, :start, :stop, :restart]
  end

# service to be restarted if new jar
  execute 'restart service if new jar' do
    command "sudo systemctl restart #{serviceName}"
    user 'root'
    group 'root'
    not_if "diff -q #{pomPath} #{formerPomPath} && [ -f #{formerPomPath} ]"
  end

  execute 'cp pom to former pom' do
    command "cp #{pomPath} #{formerPomPath}"
    user user
    group group
  end

end