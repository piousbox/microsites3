
require 'spec_helper'

describe GalleriesController do

  before :each do
    setup_users

    Photo.unscoped.each { |ph| ph.remove }

    Report.unscoped.each { |c| c.remove }
    
    Gallery.unscoped.each { |g| g.remove }
    @g = @gallery = FactoryGirl.create :gallery, :user => @user
    @g1 = FactoryGirl.create :g1, :user => @user
    @g2 = FactoryGirl.create :g2, :user => @user
    @private_gallery = FactoryGirl.create :private_gallery, :user => @user
    
    photos = Photo.all[0...4]
    photos.each do |photo|
      photo.gallery = @g
      photo.save
    end

    @ph1 = Photo.create :user => @user, :name => 'ph1'
    @ph2 = Photo.create :user => @user, :name => 'ph2'
    @ph3 = Photo.create :user => @user, :name => 'ph3'

    setup_sites
    @request.host = 'piousbox.com'
    @request.env['HTTP_REFERRER'] = 'http://piousbox.com'
    request.env['HTTP_REFERRER'] = 'http://piousbox.com'
  end

  describe 'not found' do
    it 'should display gallery-not-found' do
      Gallery.where( :galleryname => 'g' ).each { |g| g.remove }
      get :show, :galleryname => 'g', :locale => :en, :photo_idx => 0
      response.should be_redirect
    end
  end

  describe 'search' do
    it 'should search' do
      sign_in :user, @user
      get :search, :q => 'yada', :locale => :en
      response.should render_template('index')
      assigns(:galleries).should_not eql nil
    end
  end

  describe 'show' do
    it 'redirects from id to galleryname path' do
      get :show, :id => @g.id, :locale => :en
      response.should be_redirect
      response.should redirect_to(gallery_path(@g.galleryname, 0))
      
      get :show, :galleryname => @g.galleryname, :locale => :en, :photo_idx => 0
      response.should be_success
    end

    it 'GETs show' do
      Photo.all.length.should >= 2
      Photo.all.each do |ph|
        @g.photos << ph
      end
      @g.save
      @g.photos.length.should >= 2
      get :show, :galleryname => @g.galleryname, :locale => :en, :photo_idx => 0
      response.should be_success
      response.should render_template('galleries/show')
      assigns(:related_galleries).should_not eql nil
    end

    it 'shows long' do
      @photo = Photo.new
      @g.photos << FactoryGirl.create( :photo )
      @g.save
      new_g = Gallery.find( @g.id )
      new_g.photos.length.should eql 1
      get :show, :galleryname => @g.galleryname, :style => 'show_long', :locale => :en
      response.should render_template('show_long')
    end

    it 'shows photo' do
      @g.galleryname.should_not eql nil
      @g.photos << FactoryGirl.create( :photo )
      @g.save
      get :show, :galleryname => @g.galleryname, :locale => :en, :photo_idx => 0
      response.should render_template('show')
      assigns( :photos ).should_not eql nil
    end

    it 'does not display cities layout' do
      get :show, :galleryname => @g.galleryname, :layout => 'cities', :locale => :en, :photo_idx => 0
      response.should render_template('layouts/application_foundation')
    end

    it 'shows only non-trash photos' do
      get :show, :galleryname => @g.galleryname, :locale => :en, :locale => :en, :photo_idx => 0
      assigns(:photos).each do |photo|
        photo.is_trash.should eql false
      end
    end

    it 'redirects to first image if index of photo is out of bounds' do
      @g.photos << FactoryGirl.create( :photo )
      @g.save
      get :show, :galleryname => @g.galleryname, :photo_idx => 100, :locale => :en
      response.should be_redirect
      response.should redirect_to("/en/galleries/show/#{@g.galleryname}/0")
    end

    it 'GETs show for json' do
      get :show, :galleryname => @g.galleryname, :format => :json, :locale => :en
      response.should be_success
    end

    it '#j_show' do
      get :j_show, :id => @g.id, :format => :json, :locale => :en
      response.should be_success
    end

    it '#no_photos' do
      @gallery.photos.each { |p| p.remove }
      get :show, :galleryname => @g.galleryname, :photo_idx => 0, :locale => :en
      response.should be_success
      response.should render_template( 'galleries/no_photos' )
    end

    it 'shows a private gallery to me' do
      sign_in @private_gallery.user
      get :show, :galleryname => @private_gallery.galleryname, :photo_idx => 0, :locale => :en
      response.should be_success
    end

    it 'does not show a private gallery to someone else' do
      sign_out :user
      sign_in @user_2
      controller.current_user.should_not eql nil
      controller.current_user.should_not eql @private_gallery.user
      get :show, :galleryname => @private_gallery.galleryname, :photo_idx => 0, :locale => :en
      response.should be_redirect
      response.should redirect_to( '/en/users/sign_in' )
    end

  end

  # describe 'set show style' do
  #   it 'does' do
  #     sign_out :user
  #     post :set_show_style, :locale => :en, :style => 'plain'
  #     response.should be_redirect
  #     false.should eql true # @TODO:
  #     # get :show, :galleryname => @g.galleryname, :locale => :en
  #     # response.should render_template('show')
  #   end
  # end
  
  describe 'index' do
    it 'gets galleries, created_at order' do
      get :index, :format => :json, :domainname => 'pi.local', :locale => :en
      response.should be_success
      
      gs = assigns(:galleries)
      gs.should_not be nil
      gs.each do |g|
        g.is_public.should eql true
        g.username.should_not eql nil
      end
    end

    it "only shows galleries of this site" do
      site = Site.where( :domain => 'piousbox.com', :lang => 'en' ).first
      get :index, :locale => :en
      response.should be_redirect
      get :index, :domainname => site.domain, :locale => :en
      assigns(:galleries).should_not eql nil
      assigns( :galleries ).each do |g|
        g.site.domain.should eql site.domain
        g.site.lang.should eql site.lang
      end
    end
  end

  describe 'create, edit, update' do
    before :each do
      setup_sites
    end

    it 'GETs new' do
      sign_in :user, @user
      get :new, :locale => :en
      response.should be_success
      response.should render_template( 'galleries/new' )
      assigns( :cities_list ).should_not eql nil
      assigns( :cities_list ).length.should >= 1
      assigns( :tags_list ).should_not eql nil
    end

    it 'creates newsitem for site' do
      # @request.host = 'pi.local'
      
      sign_in :user, @user
      
      old_n_newsitems = Site.where( :lang => 'en', :domain => 'piousbox.com' ).first.newsitems.all.length

      g = { :is_public => true, :name => 'Name', :galleryname => 'galleryname', :user => User.all.first }
      post :create, :gallery => g, :locale => :en

      # non-public, should not increment newsitem count
      g = { :is_public => false, :name => 'Name1', :galleryname => 'galleryname1', :user => User.all.first }
      post :create, :gallery => g, :locale => :en

      new_n_newsitems = Site.where( :lang => 'en', :domain => 'piousbox.com' ).first.newsitems.all.length
      ( new_n_newsitems - 1 ).should eql old_n_newsitems
    end

    it 'GETs edit' do
      sign_in :user, @gallery.user
      get :edit, :id => @gallery.id, :locale => :en
      response.should render_template( 'galleries/edit' )
      assigns( :cities_list ).should_not eql nil
    end

    it 'PUTs update' do
      sign_in :user, @user
      @gallery.user.should eql @user
      post :update, :id => @gallery.id, :gallery => @gallery.attributes, :locale => :en
      response.should be_redirect
    end
  end
  
end
