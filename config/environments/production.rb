Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.read_encrypted_secrets = true
  config.public_file_server.enabled = true # ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = true
  config.log_level = :info
  config.log_tags = [ :request_id ]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: 'manager.piousbox.com' }
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

Paperclip.options[:image_magick_path] = "/usr/bin"
Paperclip.options[:command_path] = "/usr/bin"

Rails.application.config.middleware.use ExceptionNotification::Rack,
  email: {
    deliver_with: :deliver, # Rails >= 4.2.1 do not need this option since it defaults to :deliver_now
    email_prefix: '[M3] ',
    sender_address: %{"m3 exceptionist" <autobot@wasya.co>},
    exception_recipients: %w{piousbox@gmail.com}
  }
