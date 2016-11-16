def find_open_port
  port = 8889
  begin
    s = TCPServer.new('127.0.0.1', port)
    s.close
  rescue
    port += 1
    retry
  end
  port
end
log_level                :info
log_location             STDOUT
local_mode true
config_dir "#{File.expand_path('..', __FILE__)}/" # Wherefore art config_dir, chef?
chef_zero    :port => find_open_port

# Chef 11.14 binds to "localhost", which interferes with port forwarding on IPv6 machines for some reason
begin
  chef_zero.host '127.0.0.1'
rescue
end
