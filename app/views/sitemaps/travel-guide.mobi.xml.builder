xml.instruct!
xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  @cities.each do |city|
    xml.url do
      xml.loc "http://travel-guide.mobi/en/cities/travel-to/#{city.cityname}"
    end
  end

  @reports.each do |report|
    xml.url do
      xml.loc "http://travel-guide.mobi/en/reports/show/#{report.name_seo}"
    end
  end

  @galleries.each do |gallery|
    gallery.photos.each_with_index do |photo, idx|
      xml.url do
        xml.loc "http://travel-guide.mobi/en/galleries/show/#{gallery.galleryname}/#{idx}"
      end
    end
  end

end


  
