[![Build Status](https://travis-ci.org/piousbox/microsites3_api.svg?branch=master)](https://travis-ci.org/piousbox/microsites3_api)

# Intro

# Develop

port 3000

# Develop on Mac

/usr/local/lib/mongodb # that's in ~/.bashrc

 sudo brew services restart httpd

# Test

# Deploy
* aws small instance

 bundle
 RAILS_ENV=production be rake assets:precompile

 be cap vm deploy
 be cap aws_staging deploy

