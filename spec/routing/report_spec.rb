
require 'spec_helper'

describe 'reports' do
  
  it 'show' do
    expect( :get => '/en/reports/some-id' ).to route_to( 'reports#show', :locale => 'en', :id => 'some-id' )
    expect( :get => '/en/reports/view/some-name' ).to route_to( 'reports#show', :locale => 'en', :name_seo => 'some-name' )
  end

  it 'delete/destroy' do
    expect( :delete => '/en/reports/some-id' ).to route_to( 'reports#destroy', :locale => 'en', :id => 'some-id' )
  end

end


