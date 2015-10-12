
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

    # somehow this delivers all the reports of the city? # @TODO _vp_ 20151010
    @city['reports'] = []
    
    respond_to do |format|
      format.json do
        render :json => @city
      end
    end
  end

end
