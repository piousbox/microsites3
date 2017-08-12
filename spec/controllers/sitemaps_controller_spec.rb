require 'spec_helper'
describe SitemapsController do
  render_views
  before do
    Site.all.destroy
    @site_local = FactoryGirl.create :site, :domain => 'localhost'

    setup_users
    sign_in @manager, :scope => :user
  end

  it '#show' do
    get :show, :params => { :domainname => 'localhost' }, :format => :xml
    response.should render_template( 'sitemaps/localhost' )

    get :show, :params => { :domainname => 'test_1.com' }, :format => :xml
    response.should render_template( 'sitemaps/test_1.com' )
  end

end
