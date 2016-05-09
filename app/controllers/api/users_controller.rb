
class Api::UsersController < Api::ApiController

  def scratchpad
    authorize! :scratchpad, current_user
    render :json => current_user.scratchpad
  end

  def update_scratchpad
    authorize! :scratchpad, current_user
    current_user.scratchpad = params[:data]
    if current_user.save
      render :json => { :status => :ok }
    else
      render :json => { :code => '400', :message => current_user.error.messages }
    end
  end

end
