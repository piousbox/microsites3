
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
  end

end
