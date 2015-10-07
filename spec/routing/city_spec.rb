
require 'spec_helper'

describe Api::CitiesController do

  it 'index' do
    expect( :get => 'api/cities.json' ).to route_to( 'api/cities#index', :format => 'json' )
  end

  it 'show' do
    expect( :get => 'api/cities/travel-to/Chicago.json' ).to route_to( 'api/cities#show', :format => 'json', :cityname => 'Chicago' )
  end  

  private 

  def default_routing_options
    { :locale => 'en' }
  end

end
