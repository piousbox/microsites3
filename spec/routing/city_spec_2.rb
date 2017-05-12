require 'spec_helper'

describe 'routing' do
  before :each do
    @routes = Engine.routes
  end

  it 'routes' do
    expect( :get, '/api/cities.json' ).to route_to( 'api/cities#index' )
  end
end

=begin
module Ishapi
  class CitiesControllerTest < ::ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
    end

    def test_cities_index
      result = get '/api/cities.json'
      puts! result
    end
  end
end
=end
