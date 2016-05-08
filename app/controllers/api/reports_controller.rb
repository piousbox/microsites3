
class Api::ReportsController < Api::ApiController

  before_action :authenticate_request, :except => [ :show, :index ]
  
  def index
    @reports = Report.page( params[:reports_page] ).per( Report::PER_PAGE )
    authorize! :index, Report.new
    respond_to do |format|
      format.json do
        render :json => @reports
      end
    end
  end

  def show
    @report = Report.where( :name_seo => params[:name_seo] ).first
    
    unless @report.is_public
      authenticate_request
    end
    
    authorize! :show, @report
    
    respond_to do |format|
      format.json do
        render :json => @report
      end
    end
  end

end
