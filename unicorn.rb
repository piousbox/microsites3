worker_processes 8

working_directory "/home/piousbox/projects/microsites3_api" 

listen "/tmp/microsites3_api.sock", :backlog => 64
listen 3004, :tcp_nopush => true

timeout 300

pid "/home/piousbox/projects/microsites3_api/tmp/pids/unicorn.pid"

stderr_path "/home/piousbox/projects/microsites3_api/log/microsites3_api.unicorn.stderr.log"
stdout_path "/home/piousbox/projects/microsites3_api/log/microsites3_api.unicorn.stdout.log"

user "piousbox", "piousbox"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

before_fork do |server, worker|
  # defined?(ActiveRecord::Base) and
  #   ActiveRecord::Base.connection.disconnect!

  # old_pid = "#{server.config[:pid]}.oldbin"
  # if old_pid != server.pid
  #   begin
  #     sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
  #     Process.kill(sig, File.read(old_pid).to_i)
  #   rescue Errno::ENOENT, Errno::ESRCH
  #   end
  # end
  
  sleep 1
end

after_fork do |server, worker|
  # defined?(ActiveRecord::Base) and
  #   ActiveRecord::Base.establish_connection
  
end
