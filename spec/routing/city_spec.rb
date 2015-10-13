
require 'spec_helper'

describe 'route to api/cities ctrl' do

  it 'index' do
    expect( :get => 'api/cities.json' ).to route_to( 'api/cities#index', :format => 'json' )
  end

  it 'show' do
    expect( :get => 'api/cities/Chicago.json' ).to route_to( 'api/cities#show', :format => 'json', :cityname => 'Chicago' )
  end  

end
