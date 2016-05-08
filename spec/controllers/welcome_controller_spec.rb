
require 'spec_helper'

describe WelcomeController, :type => :controller do

  render_views
  
  before :each do
  end

  describe 'welcome ctrl functional spec' do
    
    it 'ok' do
      get :home
      response.should be_success
    end
    
  end
  
end





