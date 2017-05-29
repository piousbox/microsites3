lock "3.8.1"

set :application, "microsites3"
set :repo_url, "git@github.com:piousbox/microsites3.git"

set :deploy_user, 'ubuntu'
set :scm, :git
set :deploy_to, "/home/ubuntu/projects/microsites3_capistrano"

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
