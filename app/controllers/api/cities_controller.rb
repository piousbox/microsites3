
class Api::CitiesController < Api::ApiController

  def index
    @cities = City.all
    authorize! :index, City.new
    respond_to do |format|
      format.json do
        render :json => @cities
      end
    end
  end

  def show    
    @city = City.where( :cityname => params[:cityname] ).first
    authorize! :show, @city
    respond_to do |format|
      format.json do
        render :json => @city
      end
    end
  end

end
