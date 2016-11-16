
#default['artifact_repo_url']  = 'http://bsi-nexus.corp.adobe.com:8080/nexus/content/repositories/hub-releases/'  
default['artifact_repo_url']  = 'http://10.5.114.182:8080/nexus/content/repositories/hub-releases/'  

## java attributes  
default['devopsdays']['java']['home'] = File.join(node['apps_dir'], '/java')
default['devopsdays']['java']['jdkurl'] = node['artifact_repo_url']+'com/oracle/jdk/8u72-linux-x64/jdk-8u72-linux-x64.tar.gz'
# TODO checksum
default['devopsdays']['java']['jdkchecksum'] = 'cfa44b49e50ea06e5c6ab95ff79e5b2a'  
# checksum : https://www.oracle.com/webfolder/s/digest/7u72checksum.html 
default['java']['jdk_version'] = '1.8.0_72'
 
default['devopsdays']['jdk_keytool'] = File.join(node['devopsdays']['java']['home'], '/bin/keytool')
default['devopsdays']['jre_truststore'] = File.join(node['devopsdays']['java']['home'], '/jre/lib/security/cacerts')  
  
# -Xms<size>        set initial Java heap size
default['devopsdays']['jvm_initial_heap'] = '2048m'
# -Xmx<size>        set maximum Java heap size
default['devopsdays']['jvm_max_heap']= '16384m'
# -XX:MaxPermSize=64m	Size of the Permanent Generation.
default['devopsdays']['jvm_max_perm_size'] = '256m'  
# -XX:NewSize=2m	Default size of new generation 
default['devopsdays']['jvm_new_size'] = '100m'
# -XX:MaxNewSize=size	Maximum size of new generation 
default['devopsdays']['jvm_max_new_size'] = '700m'

default['devopsdays']['jmx_port'] = '9010'
default['devopsdays']['jmx_enabled']= 'true'

default['devopsdays']['debug']=true
default['devopsdays']['debug_port']='5005'
  
# Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files 7 jars 
default['devopsdays']['java']['local_policy_url'] = node['artifact_repo_url']+'com/oracle/jce/local_policy/8/local_policy-8.jar'
default['devopsdays']['java']['US_export_policy_url'] = node['artifact_repo_url']+'com/oracle/jce/US_export_policy/8/US_export_policy-8.jar'
   