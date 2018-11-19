
set :deploy_to, "/opt/ruby/fg_rails"
set :app_user, "ubuntu"

server '178.128.129.12', :user => 'ubuntu', :roles => [ :web ], :primary => true

