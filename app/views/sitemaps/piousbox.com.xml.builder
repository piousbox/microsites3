xml.instruct!
xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  # reports
  @reports.each do |report|
    xml.url do
      xml.loc "#{@domain}#{Sitemap.report_path(report)}"
    end
  end

end


  
