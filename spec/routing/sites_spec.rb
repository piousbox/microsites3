require 'spec_helper'
describe 'routes of sites' do

  it 'sitemaps' do
    expect( :get => '/sites/local.com/sitemap.xml' ).to route_to( 'sitemaps#show', :domainname => 'local.com', :format => 'xml' )
  end

end
