worker_processes 8

working_directory "/home/ubuntu/projects/microsites3_api" 

listen "/tmp/microsites3_api.sock", :backlog => 64
listen 8089, :tcp_nopush => true

timeout 300

pid "/home/ubuntu/projects/microsites3_api/tmp/pids/unicorn.pid"

stderr_path "/home/ubuntu/projects/microsites2/shared/log/microsites3_api.unicorn.stderr.log"
stdout_path "/home/ubuntu/projects/microsites2/shared/log/microsites3_api.unicorn.stdout.log"

user "ubuntu", "ubuntu"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

before_fork do |server, worker|
  sleep 1
end

after_fork do |server, worker|
end
