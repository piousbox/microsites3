lock "3.8.1"

set :application, "microsites3a"
set :ruby_version, "2.5.0"
set :repo_url, "git@github.com:piousbox/microsites3.git"
set :deploy_to, "/home/ubuntu/projects/microsites3a"

append :linked_files, "config/initializers/00_s3.rb", "config/mongoid.yml", "config/initializers/koala.rb", "config/initializers/05_stripe.rb", "config/initializers/06_ally.rb"

set :deploy_via, :remote_cache

this_script =<<~AOL
  cd #{fetch(:deploy_to)}/current
  rm -rf .bundle
  rm Gemfile.lock
  bundle --path vendor/bundle
AOL

namespace :deploy do
  task :bundle do
    on roles(:web) do
      execute "cd #{fetch(:deploy_to)}/current && " +
        "sudo /home/#{fetch(:app_user)}/.rbenv/versions/#{fetch(:ruby_version)}/bin/bundle --path /home/#{fetch(:app_user)}/projects/#{fetch(:application)}/vendor/bundle && " +
        "sudo chown #{fetch(:app_user)} -R /home/ubuntu/projects/microsites3a/releases/"
    end
  end

  task :restart_nginx do
    on roles(:web) do
      # execute "sudo systemctl restart nginx.service"
      execute "sudo pkill nginx; sleep 1; sudo nginx"
    end
  end

  task :restart_stockwatcher do
    on roles(:web) do
      execute "sudo systemctl restart stockwatcher.service"
    end
  end

end

after "deploy:published", "restart_nginx" # to clear memory for bundler
after "deploy:published", "bundle"
after "deploy:published", "restart_nginx"
after "deploy:published", "restart_stockwatcher"

