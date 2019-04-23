source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'ahoy_matey'
gem 'newrelic_rpm'
gem 'rails', '~> 5.1.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'aws-sdk', '~> 2'
gem 'mongoid', '~> 6.1.0'
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem "mongoid-autoinc", "~> 6.0"

gem "kaminari-mongoid"
gem 'koala'

gem 'unicorn'
gem 'paperclip', "~> 5.3.0"
gem 'rack-cors'

gem 'ish_models',  :github => 'piousbox/ish_models',  :branch => :master
gem 'ish_manager', :github => 'piousbox/ish_manager', :branch => :master # '0.1.10
gem 'ishapi',      :github => 'piousbox/ishapi',      :branch => :master
gem 'stripe'

gem "devise", "~> 4.3" 

gem 'nokogiri', '~> 1.8.1'
gem 'rspec'       # need this in production
gem 'rspec-rails' # need this in production

gem 'httparty'
gem 'listen', '>= 3.0.5', '< 3.2'
gem 'oauth'
# gem 'dropbox_api'
gem 'tzinfo-data'
gem 'tzinfo'

# gem 'google-api-client'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'jwt'
gem 'googleauth'
# gem 'google-api-client' # , '~> 0.4.3', :require => 'google/api_client'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'capistrano', '3.8.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-ext'
  gem 'capistrano-bundler'
end
