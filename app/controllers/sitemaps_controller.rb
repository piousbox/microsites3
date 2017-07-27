
class SitemapsController < ApplicationController

  layout false

  def show
    @domain = "http://#{params[:domainname]}"

    respond_to do |format|
      format.xml do

        case params[:domainname]
        when 'travel-guide.mobi'
          @cities = City.all
          render params[:domainname]
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
