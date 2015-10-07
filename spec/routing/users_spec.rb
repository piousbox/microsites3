require 'spec_helper'
describe 'Users' do

  it 'resume' do
    expect( :get => '/en/users/pi/resume/print' ).to route_to( 'users#show', :locale => 'en', :print => true, :username => 'pi' )
    expect( :get => '/en/users/show/pi' ).to route_to( 'users#show', :locale => 'en', :username => 'pi' )
    expect( :get => '/en/users/pi/resume' ).to route_to( 'users#show', :locale => 'en', :username => 'pi' )
  end

  it 'organizer' do
    expect( :get => '/en/users/organizer' ).to route_to( 'users#organizer', :locale => 'en' )
  end

  it 'organizer2' do
    expect( :get => 'en/users/organizer2' ).to route_to( 'users#organizer2', :locale => 'en' )
  end

  it 'update' do
    expect( :patch => 'en/users/show/user-id' ).to route_to( 'users#update', :locale => 'en', :id => 'user-id' )
    expect( :put => 'en/users/user-id' ).to route_to( 'users#update', :locale => 'en', :id => 'user-id' )
    expect( :put => 'en/users/show/user-id' ).to route_to( 'users#update', :locale => 'en', :id => 'user-id' )
  end
  
end


