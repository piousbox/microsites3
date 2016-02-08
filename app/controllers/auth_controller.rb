
class AuthController < ApplicationController
  
  skip_before_action :authenticate_request
  skip_authorization_check
  
  def authenticate
    # From: https://github.com/plataformatec/devise/wiki/How-To:-Find-a-user-when-you-have-their-credentials
    user = User.find_for_authentication( :username => params[:username] )
    flag = user.valid_password? params[:password]
    if flag
      render json: { auth_token: user.generate_auth_token }
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end
  
end
