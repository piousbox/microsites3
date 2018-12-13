Rails.application.configure do
  
  # config.logger = Logger.new("#{Rails.root}/log/docker.log")
  config.logger = ActiveSupport::Logger.new("#{Rails.root}/log/docker.log")

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # 20171018 _vp_
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching       = false
  config.active_support.deprecation          = :log
  config.action_mailer.default_url_options   = { :host => 'localhost', :port => 3000 }
  config.action_mailer.delivery_method       = :smtp
  config.action_mailer.smtp_settings         = {
    :accress              => 'smtp.gmail.com',
    :port                 => 587,
    :domain               => 'gmail.com',
    :authentication       => :plain,
    :enable_starttls_auto => true,
    :user_name            => ENV['GMAIL_USERNAME'],
    :password             => ENV['GMAIL_PASSWORD']
  }

  config.assets.debug = true
  config.assets.quiet = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

=begin
  config.paperclip_defaults = {
    :storage => :s3,
    :s3_region => ENV['AWS_REGION'],
    :s3_credentials => {
      :bucket => ENV['AWS_BUCKET'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  }
=end

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => ENV["GMAIL_DOMAIN"],
    :authentication       => "plain",
    :enable_starttls_auto => true,
    :user_name            => ENV["GMAIL_USERNAME"],
    :password             => ENV["GMAIL_PASSWORD"]
  }

end

