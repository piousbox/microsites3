require 'spec_helper'
describe 'route ish_manager galleries' do
  routes { Ishapi::Engine.routes }

  it 'index_titles' do
    expect( :get => '/galleries/index_titles' ).to route_to( 'galleries#index_titles' )
  end

=begin
  it 'index' do
    expect( :get => '/cities.json' ).to route_to( 'ishapi/cities#index', :format => 'json' )
  end

  it 'show' do
    expect( :get => '/cities/view/Chicago.json' ).to route_to( 'ishapi/cities#show', :format => 'json', :cityname => 'Chicago' )
  end  
=end

end
