
require 'spec_helper'

RSpec.describe Api::ReportsController, :type => :controller do

  render_views

  before :each do
    setup_users
    sign_in :user, @manager

    setup_sites

    Report.all.each { |c| c.remove }
    @r1 = FactoryGirl.create :r1
    @r1.user = @user
    @r1.save
    @r9 = FactoryGirl.create :r9
    Report.all.each do |report|
      report.site = @site
      report.save
    end
    
    City.all.each { |c| c.remove }
    @city = FactoryGirl.create :rio
    n = Newsitem.new :descr => 'first newsitem' 
    @city.newsitems << n    
  end

  describe 'functional spec of api/reports_controller' do

    it 'index' do
      get :index, :format => :json
      response.should be_success
      assigns( :reports ).should_not eql nil
    end

    it 'show' do
      get :show, :name_seo => @r1.name_seo, :format => :json
      response.should be_success
      report = assigns( :report )
      report.should_not eql nil
    end
    
  end

end
