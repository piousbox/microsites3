xml.instruct!
xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  # cities
  @cities.each do |city|
    xml.url do
      xml.loc "http://travel-guide.mobi/en/cities/travel-to/#{city.cityname}"
    end
  end

end


  
