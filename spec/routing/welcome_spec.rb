
require 'spec_helper'

describe 'route to welcome ctrl' do

  it 'home' do
    expect( :get => '/' ).to route_to( 'welcome#home' )
  end
  
end
