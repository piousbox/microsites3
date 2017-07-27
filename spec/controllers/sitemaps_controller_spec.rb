require 'spec_helper'
describe SitemapsController do
  render_views
  before do
    Site.all.destroy
    @site_local = FactoryGirl.create :site, :domain => 'localhost'
  end

  it '#show' do
    get :show, :params => { :domainname => 'localhost' }, :format => :xml
    response.should render_template( 'sitemaps/show' )
  end

end
