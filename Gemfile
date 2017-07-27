source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'aws-sdk', '~> 2'
gem 'mongoid', '~> 6.1.0'
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem "kaminari-mongoid"
gem 'koala'
gem 'unicorn'
gem 'paperclip'
gem 'rack-cors'

gem 'ish_models',  :github => 'piousbox/ish_models',  :branch => :master
gem 'ish_manager', :github => 'piousbox/ish_manager', :branch => :master
gem 'ishapi',      :github => 'piousbox/ishapi',      :branch => :master

gem "devise", "~> 4.3" 

# need this to run rake in production
gem 'nokogiri'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
end
