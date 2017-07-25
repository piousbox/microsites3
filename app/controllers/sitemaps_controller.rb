
class SitemapsController < ApplicationController

  def show
    respond_to do |format|
      format.xml do
        @cities = City.all
        render :layout => false
      end
    end
  end

end

