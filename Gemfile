source 'https://rubygems.org'

gem 'rails', '~> 4.2'
gem "core_extensions", "~> 0.0.4"
gem 'activesupport'
gem 'activeresource'
gem 'rack-cors', :require => 'rack/cors'

gem 'recaptcha'

gem 'aws-sdk', '< 2.0'
gem "aws-s3",            :require => "aws/s3"

gem 'bson'
gem "moped", github: "mongoid/moped"
gem 'mongoid', '4.0.2'
gem 'mongoid-history'
gem 'mongoid_paranoia', :github => 'simi/mongoid-paranoia'
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem 'mongo_session_store-rails4'

gem 'paperclip', ['>= 3.4', '!= 4.3.0']
gem 'kaminari'
gem 'haml'
gem 'haml-rails'
gem 'sass'
gem 'nokogiri'
gem 'devise'
gem 'cancan', '~> 1.5'
gem 'bcrypt-ruby', '3.1.1.rc1', :require => 'bcrypt'
gem 'tzinfo'
gem 'eventmachine'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'

gem 'unicorn'
gem 'passenger'
gem 'jwt'

gem 'ish_lib_assets'
gem 'ish_lib_engine'

group :test do
  gem 'rspec-rails'
  gem 'rspec'
  gem 'rspec-mocks'
  gem 'factory_girl_rails'  
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'ruby-prof'
  gem 'simplecov', :require => false
end

group :development, :development_production, :test do
  gem 'net-ssh', '2.4.0'
  gem 'capybara'
  gem 'quiet_assets'
  gem 'thin'
  gem 'delayed_job_mongoid'
  gem 'hpricot'
end

group :test, :development, :development_production, :util do
  gem 'simple-rss', :git => "git://github.com/piousbox/simple-rss.git"
  gem 'htmlentities' # need with simple-rss
  gem 'resque'
  gem 'minitest'
end
