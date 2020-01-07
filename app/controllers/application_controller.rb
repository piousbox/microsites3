class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :except => [ :test, :share, :auth_callback ]
  
  def home
  end

  def test
    render :json => { :status => :ok }
  end

  def error
    render 'nonexistent'
  end
  
  def share
    render 'share'
  end

  def auth_callback
    puts! params, 'params'
    puts! request.env['omniauth.auth'], 'hash'
    render 'empty'
  end

=begin
  rescue_from ::CanCan::AccessDenied, :with => :access_denied
  private
  def access_denied exception
    store_location_for :user, request.path
    redirect_to user_signed_in? ? root_path : new_user_session_path, :alert => exception.message
  end
=end

end
