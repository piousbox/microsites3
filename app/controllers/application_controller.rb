require 'string'
require 'float'

class NotAuthenticatedError < StandardError
end

class AuthenticationTimeoutError < StandardError
end

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_defaults

  before_action :set_current_user, :authenticate_request
  
  rescue_from NotAuthenticatedError do
    render json: { error: 'Not Authorized' }, status: :unauthorized
  end
  rescue_from AuthenticationTimeoutError do
    render json: { error: 'Auth token is expired' }, status: 419 # unofficial timeout status code
  end
  
  CACHE_OPTIONS = { :expires_in => 12.hours }

  # include ActionController::Caching::Sweeping
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to sign_in_path, :notice => t('users.please_sign_in')
  end

  check_authorization

  private

  # Based on the user_id inside the token payload, find the user.
  def set_current_user
    if decoded_auth_token
      @current_user ||= User.find(decoded_auth_token[:user_id])
    end
  end
  
  # Check to make sure the current user was set and the token is not expired
  def authenticate_request
    if auth_token_expired?
      fail AuthenticationTimeoutError
    elsif !@current_user
      fail NotAuthenticatedError
    end
  end
  
  def decoded_auth_token
    @decoded_auth_token ||= AuthToken.decode(http_auth_header_content)
  end
  
  def auth_token_expired?
    decoded_auth_token && decoded_auth_token.expired?
  end
  
  # JWT's are stored in the Authorization header using this format:
  # Bearer somerandomstring.encoded-payload.anotherrandomstring
  def http_auth_header_content
    return @http_auth_header_content if defined? @http_auth_header_content
    @http_auth_header_content = begin
                                  if request.headers['Authorization'].present?
                                    request.headers['Authorization'].split(' ').last
                                  else
                                    nil
                                  end
                                end
  end



  
  def after_sign_in_path_for resource
    organizer_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
  # Get locale from top-level domain or return nil if such locale is not available
  # You have to put something like:
  #   127.0.0.1 application.com
  #   127.0.0.1 application.it
  #   127.0.0.1 application.pl
  # def extract_locale_from_tld
  #   parsed_locale = request.host.split('.').last
  #   I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
  # end
  
  # Get locale code from request subdomain (like http://it.application.local:3000)
  #   127.0.0.1 gr.application.local
  # def extract_locale_from_subdomain
  #   parsed_locale = request.subdomains.first || 'en'
  #   I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : :en
  # end

  # def extract_layout_from_subdomain
  #   if request.host.split('.').include? 'm'
  #     @layout = 'organizer'
  #   else
  #     @layout = params[:layout] || 'application'
  #   end
  # end

  def default_url_options(options={})
    options[:locale] = I18n.locale || I18n.default_locale
    # options[:layout] = @layout || 'application'
    options
  end
  
  def set_defaults
    # I18n.locale = extract_locale_from_tld || I18n.default_locale
    # @locale = I18n.locale = params[:locale] || I18n.default_locale
    # @locale = I18n.locale = extract_locale_from_subdomain
    @locale = I18n.locale = params[:locale] || 'en'
    @domain = request.host
    @port = Rails.env.development? ? request.port.to_s : nil
    @site = Site.where( :domain => @domain, :lang => @locale ).first
    @action_name = params[:controller].gsub('/', '_') + '_' + params[:action]
    @action_classes = "#{params[:controller].gsub('/', '_')} #{params[:action]}" # #{@locale}
    @display_ads = false
  end

  def load_features args = {}
    @newsitems = []
    @features = []
  end

  private 

  def puts! arg, label=""
    unless Rails.env.production?
      puts "+++ +++ #{label}"
      puts arg.inspect
    end
  end
  
  def sett_lists
    @tags_list = Tag.list
  end
  
end

#class ActionMailer::Base
#  def default_url_options options = {}
#    options[:locale] ||= 'en'
#    options[:host] ||= 'piousbox.com'
#    return options
#  end
#end

