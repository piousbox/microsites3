class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :except => [ :test ]
  
  def home
  end

  def test
    render :json => { :status => :ok }
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
