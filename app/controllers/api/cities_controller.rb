
class Api::CitiesController < Api::ApiController

  def index
    @cities = City.all
    authorize! :index, City.new

    @cities = @cities.to_a
    @cities.each_with_index do |city, idx|
      @cities[idx]['coords'] = { latitude: city.x, longitude: city.y }
    end
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
    @city['reports_map'] = Report.where( :city_id => @city.id, :x.exists => true, :y.exists => true )
    
    @features = @city.features.limit( @city.n_features )
    @newsitems = @city.newsitems.limit( 10 )

  end

end
