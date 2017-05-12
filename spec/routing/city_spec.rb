require 'spec_helper'
describe 'route api/cities' do
  routes { Ishapi::Engine.routes }

  it 'home' do
    expect( :get => '/' ).to route_to( 'ishapi/api#home' )
  end

  it 'index' do
    expect( :get => '/cities.json' ).to route_to( 'ishapi/cities#index', :format => 'json' )
  end

  it 'show' do
    expect( :get => '/cities/view/Chicago.json' ).to route_to( 'ishapi/cities#show', :format => 'json', :cityname => 'Chicago' )
  end  

end
