
set :deploy_to, "/home/ubuntu/projects/microsites3a"
set :app_user, "ubuntu"

server '178.128.129.12', :user => 'ubuntu', :roles => [ :web ], :primary => true

