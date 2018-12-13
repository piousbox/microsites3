
set :deploy_user, 'ubuntu'
set :deploy_to, "/home/ubuntu/projects/microsites3"
set :app_user, "ubuntu"

server 'do', :user => 'ubuntu', :roles => [ :web ], :primary => true
