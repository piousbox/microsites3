
require 'spec_helper'

describe ReportsController do

  before :each do
    setup_users
    sign_in :user, @user

    setup_sites

    Report.unscoped.each { |c| c.remove }
    @r1 = FactoryGirl.create :r1
    @r1.user = @user
    @r1.save
    @r9 = FactoryGirl.create :r9
    @private_report = FactoryGirl.create :report_private
    Report.all.each do |report|
      report.site = @site
      report.save
    end

    controller.request.stub :referrer => 'http://example.com'
  end

  describe 'new/create' do
    it 'does not create without recaptcha' do
      allow_any_instance_of(ReportsController).to receive(:verify_recaptcha).and_return(false)
      expect_any_instance_of(ReportsController).to receive(:verify_recaptcha).and_return(false)
      
      # sign_out :user
      # session[:current_user] = nil
      # user must be signed in
      n_old = Report.all.length
      report = { :name => '24twebfvsdfg', :name_seo => '1235fff', :descr => 'lssfllll' }
      post :create, :report => report, :locale => :en
      n_new = Report.all.length
      ( n_new - n_old ).should eql 0
    end
    
    it 'created with recaptcha' do
      allow_any_instance_of(ReportsController).to receive(:verify_recaptcha).and_return(true)
      expect_any_instance_of(ReportsController).to receive(:verify_recaptcha).and_return(true)
      
      # the user must be signed in, currently.
      n_old = Report.all.length
      report = { :name => '24twebfvsdfg', :name_seo => '1235fff', :descr => 'lssfllll', 
                 :user => User.all.first, :username => 'Aaa' }
      post :create, :report => report, :locale => :en
      n_new = Report.all.length
      ( n_new - n_old ).should eql 1
      response.should redirect_to( '/en/users/organizer' )
      result = Report.where( :name => report[:name] ).first
      result.site.should eql @site
    end

    it 'adds newsitem to homepage, upon create' do
      old_n_newsitems = @site.newsitems.all.length
      post :create, :report => { :is_public => true, :name => 'bhal bbgf' }, :locale => :en
      # and non-public
      post :create, :report => { :is_public => false, :name => 'bhal bbgfasdf s' }, :locale => :en
      new_n_newsitems = Site.find( @site.id ).newsitems.all.length
      ( new_n_newsitems - 1 ).should eql old_n_newsitems
    end

    it 'GETs new' do
      get :new, :locale => :en
      response.should be_success
      response.should render_template( 'reports/new' )
      # assigns( :cities ).should_not eql nil
      assigns( :tags_list ).should_not eql nil
      assigns( :sites_list ).should_not eql nil
      assigns( :cities_list ).should_not eql nil
      assigns( :venues_list ).should_not eql nil
    end

  end

  describe 'edit' do
    it 'GETs edit' do
      get :edit, :id => @r1.id, :locale => :en
      response.should render_template( 'reports/edit' )
      assigns( :sites_list ).should_not eql nil
      assigns( :tags_list ).should_not eql nil
      assigns( :cities_list ).should_not eql nil
      assigns( :venues_list ).should_not eql nil
    end

    it 'allows editing of a private report' do
      get :edit, :id => @private_report.id, :locale => :en
      response.should render_template( 'reports/edit' )
    end
  end

  describe 'update' do
    it 'POSTs update' do
      sign_in :user, @user
      name = 'Aaaaaabbb'
      post :update, :id => @r1.id, :report => { :name => name }, :locale => :en
      response.should be_redirect
      result = Report.find @r1.id
      result.name.should eql name
    end
    
    it 'updates a private report' do
      new_name = 'the new name'
      post :update, :id => @private_report.id, :report => { :name => new_name }, :locale => :en
      result = Report.unscoped.find @private_report.id
      result.name.should eql new_name
    end
  end
  

  describe 'search' do
    it 'should work' do
      get :search, :my => true, :keyword => 'blah', :locale => :en
      rs = assigns(:reports)
      rs.should_not eql nil
      rs.each do |r|
        flag = r.name.include?('blah')
        flag.should eql true
      end
    end
  end

  describe 'index' do
    it 'displays json index of reports, with usernames' do
      get :index, :format => :json, :domainname => 'pi.local', :locale => :en
      body = JSON.parse(response.body)
      body.length.should > 1
      if 'username' != body[0]['username']
        body[0]['username'].should eql 'anon'
      end
    end
    
    it 'redirects to domainname-scoped index of reports' do
      get :index, :locale => :en
      response.should be_redirect
      response.should redirect_to( :controller => 'reports', :action => 'index', :domainname => 'piousbox.com' )
    end

    it "shows reports for the site only" do
      get :index, :domainname => 'pi.local', :locale => :en
      response.should be_success
      assigns(:reports).each do |report|
        report.site.should_not eql nil
        report.site.domain.should eql @request.host
      end
    end
  end

  describe 'show' do
    it 'renders' do
      get :show, :name_seo => @r1.name_seo, :locale => :en
      response.should render_template('reports/show')
    end

    it 'shows private report' do
      get :show, :name_seo => @private_report.name_seo, :locale => :en
      response.should be_success
    end

    it 'does not show a private report to a user who is not the owner' do
      sign_out @user
      sign_in @user_2
      controller.current_user.should_not eql nil
      controller.current_user.should_not eql @private_report.user
      get :show, :name_seo => @private_report.name_seo, :locale => :en
      response.should be_redirect
      # although redirect is to organizer, the first redirect is to sign_in.
      response.should redirect_to '/en/users/sign_in' 
    end

    it 'GETs json' do
      get :show, :name_seo => @r1.name_seo, :format => :json, :locale => :en
      response.should be_success
    end

    it 'redirects to the right domain' do
      @site_wdz = FactoryGirl.create :site_wdz
      @r1.site = @site_wdz
      @r1.save
      get :show, :name_seo => @r1.name_seo, :locale => :en
      response.should be_redirect
      response.should redirect_to("http://#{@site_wdz.domain}/en/reports/view/#{@r1.name_seo}")
    end

    it 'redirects to the right locale' do
      @r1.lang = 'pt'
      @r1.save
      get :show, :name_seo => @r1.name_seo, :locale => 'en'
      response.should be_redirect
      response.should redirect_to( "/pt/reports/view/#{@r1.name_seo}" )
    end
  end

  it 'destroy' do
    Report.unscoped.find( @r1.id ).is_trash.should eql false
    delete :destroy, :id => @r1.id, :locale => :en
    Report.unscoped.find( @r1.id ).is_trash.should eql true
  end
  
end




