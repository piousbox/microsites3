
class SitemapsController < ApplicationController

  layout false

  def show
    @domain = "http://#{params[:domainname]}"

    respond_to do |format|
      format.xml do
        
        case params[:domainname]
        when 'travel-guide.mobi'
          @site = Site.find_by( :domain => params[:domainname], :lang => :en )
          @cities = City.all
          @reports = @site.reports # Report.all
          @galleries = @site.galleries # Gallery.all
        when 'piousbox.com'
          @reports = Report.all
          @galleries = Gallery.all
          @videos = Video.all
          @cities = City.all
        end
        
        render params[:domainname]        
     end
    end
  end
  
end
