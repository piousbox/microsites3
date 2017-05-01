
class Api::SitesController < Api::ApiController

  def index
  end

  def show
    domain = params[:domain]
    domain = domain[0, domain.length - 5] if '.json' == domain[-5, 5]
    @site = Site.find_by( :domain => domain, :lang => :en )
    @newsitems = @site.newsitems.limit( 10 )
    authorize! :show, @site
  end

end
