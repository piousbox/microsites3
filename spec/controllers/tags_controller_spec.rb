
require 'spec_helper'

describe TagsController do

  before :each do
    User.all.each { |u| u.remove }
    @user = FactoryGirl.create :user

    Report.all.each { |r| r.remove }
    @r = FactoryGirl.create :report
    @r1 = FactoryGirl.create :r1, :user => @user

    Gallery.all.each { |r| r.remove }
    @g = FactoryGirl.create :gallery
    @g1 = FactoryGirl.create :g1, :user => @user

    Tag.unscoped.each { |t| t.remove }
    @tag = FactoryGirl.create :tag_technology
    @tag.reports << [ @r, @r1 ]
    @tag.galleries << [ @g, @g1 ]
    @tag.save

    setup_sites
    @request.host = 'piousbox.com'
  end

  it 'GET index of tags in site' do
    get :index, :domainname => 'piousbox.com', :locale => :en
    response.should be_success
    response.should render_template( 'tags/index' )
    assigns( :tags ).should_not eql nil
    assigns( :tags ).each do |tag|
      tag.site.should_not eql nil
      tag.site.domain.should eql @site.domain
      tag.parent_tag.should eql nil
    end
  end

  it 'GETs show' do
    @tag.should_not eql nil
    @tag.reports.length.should > 1
    @tag.galleries.length.should > 1

    get :show, :tagname => @tag.name_seo, :locale => :en
    response.should render_template( 'tags/show' )
    assigns( :tag ).should_not eql nil

    # correct ordering of reports
    assigns( :reports ).length.should >= 2
    assigns( :reports )[0].created_at.should >= assigns( :reports )[1].created_at

    # correct ordering of galleries
    assigns( :galleries ).length.should >= 2
    assigns( :galleries )[0].created_at.should >= assigns( :galleries )[1].created_at
  end

end

