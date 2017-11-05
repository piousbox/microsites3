
namespace :captask do
  desc 'bundle'
  task :bundle do
    on "vm_12" do
      execute "cd /home/oink/projects/microsites3/current && sudo /home/oink/.rbenv/versions/2.3.1/bin/bundle install --path /home/oink/projects/microsites3/vendor/bundle "
    end
  end

  desc 'restart nginx'
  task :restart_nginx do
    on "vm_12" do
      execute "sudo systemctl restart nginx.service"
    end
  end

end
