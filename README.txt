[![Build Status](https://travis-ci.org/piousbox/microsites3_api.svg?branch=master)](https://travis-ci.org/piousbox/microsites3_api)

== Intro ==

== Develop ==

port 3000

 192.168.99.100:3011
 docker exec -it 32f40607d93d bundle exec rails c
 docker build --no-cache . -t microsites3:latest
 docker-compose down; docker-compose up

=== Develop on Mac ===

/usr/local/lib/mongodb # that's in ~/.bashrc

 sudo brew services restart httpd

== Test ==

== Deploy ==

 bundle
 RAILS_ENV=production be rake assets:precompile

 be cap staging deploy

