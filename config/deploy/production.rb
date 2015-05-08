set :rbenv_ruby, '2.1.6'
set :rbenv_type, :user
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

server_ip = `echo $BLOG_SERVER`.chomp
server_port = `echo $BLOG_PORT`.chomp.to_i
server_user = `echo $BLOG_USER`.chomp

server server_ip, user: server_user, roles: %w{web app}, port: server_port
