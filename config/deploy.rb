lock "3.8.1"

set :application, "microsites3"
set :repo_url, "git@github.com:piousbox/microsites3.git"

append :linked_files, "config/initializers/00_s3.rb", "config/mongoid.yml"
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
# set :linked_files, %w( config/initializers/00_s3.rb config/mongoid.yml )

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :deploy_via, :remote_cache

namespace :deploy do
  task :bundle do
    on roles(:web) do
      execute "cd /home/oink/projects/microsites3/current && sudo /home/oink/.rbenv/versions/2.3.1/bin/bundle --path /home/oink/projects/microsites3/vendor/bundle"
    end
  end

  task :restart_nginx do
    on roles(:web) do
      execute "sudo systemctl restart nginx.service"
    end
  end
end

after "deploy:published", "bundle"
after "deploy:published", "restart_nginx"

