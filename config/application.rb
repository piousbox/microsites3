require File.expand_path('../boot', __FILE__)

# require 'rails/all'
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"
require "sprockets/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Microsites2
  class Application < Rails::Application

    config.secret_key_base = 'abba'
    
    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W( #{Rails.root}/app/sweepers )

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    # config.encoding = "utf-8"
    config.encoding = Encoding::UTF_8

    config.filter_parameters += [ :password, :password_confirmation ]

    config.assets.paths << Rails.root.join("app", "assets", "flash")
    config.assets.precompile += [ 'print.css', 'resume.css', 'application.css', 'application_foundation.css', 'reset-min.css', 'bootstrap.css', 'bootstrap.min.css'
                                  # , 'grid.css'
                                ]
    config.assets.precompile += [ 'rails.js', 'application.js', 'application_foundation.js', 'bootstrap.js' ]
    config.assets.enabled = true
    config.assets.version = '1.0'

    # CORS
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end
    
  end
end

require "bson"
require "moped"
Moped::BSON = BSON
