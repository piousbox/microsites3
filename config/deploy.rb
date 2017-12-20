lock "3.8.1"

set :application, "microsites3"
set :repo_url, "git@github.com:piousbox/microsites3.git"

append :linked_files, "config/initializers/00_s3.rb", "config/mongoid.yml"

set :deploy_via, :remote_cache

namespace :deploy do
  task :bundle do
    on roles(:web) do
      execute "cd /home/#{fetch(:app_user)}/projects/microsites3/current && sudo /home/#{fetch(:app_user)}/.rbenv/versions/2.3.1/bin/bundle --path /home/#{fetch(:app_user)}/projects/microsites3/vendor/bundle"
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

