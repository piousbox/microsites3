
class PaypalController < ApplicationController

  protect_from_forgery :only => :nothing
  
  def ipn
    @ipn = Paypal::Ipn.new
    authorize! :ipn, @ipn
    @ipn.raw_parameters = params.to_s
    if @ipn.save
      render :json => { :status => :ok }
    else
      render :json => { :status => 'No luck.' }
    end
  end

end

