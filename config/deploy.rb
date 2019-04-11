lock "3.8.1"

set :application, "microsites3"
set :ruby_version, "2.5.0"
set :repo_url, "git@github.com:piousbox/microsites3.git"

append :linked_files, "config/initializers/00_s3.rb", "config/mongoid.yml", "config/initializers/koala.rb", "config/initializers/05_stripe.rb"

set :deploy_via, :remote_cache

namespace :deploy do
  task :bundle do
    on roles(:web) do
      execute "cd /home/#{fetch(:app_user)}/projects/microsites3/current && sudo /home/#{fetch(:app_user)}/.rbenv/versions/#{fetch(:ruby_version)}/bin/bundle --path /home/#{fetch(:app_user)}/projects/microsites3/vendor/bundle"
    end
  end

  task :restart_nginx do
    on roles(:web) do
      execute "sudo systemctl restart nginx.service"
    end
  end
end

after "deploy:published", "restart_nginx" # to clear memory for bundler
after "deploy:published", "bundle"
after "deploy:published", "restart_nginx"

