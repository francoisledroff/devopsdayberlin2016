
hostsfile_entry '127.0.0.1' do
  hostname  node['devopsdays']['servername']
  comment   'Appended by hostsfile  Recipe'
  action    :append
end
