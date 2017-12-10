require 'builder'

def puts! a, b=''
  puts "+++ +++ #{b}"
  puts a.inspect
end

namespace :tgm do

  desc "sitemap"
  task :sitemap => :environment do
    @site      = Site.find_by( :domain => 'travel-guide.mobi', :lang => :en )
    @cities    = City.all
    @reports   = @site.reports
    @galleries = @site.galleries

    xml = Builder::XmlMarkup.new( :indent => 2 )
    xml.instruct!
    xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do
      @cities.each do |city|
        xml.url do
          xml.loc "http://travel-guide.mobi/en/cities/travel-to/#{city.cityname}"
        end
        city.venues.each do |venue|
          xml.url do
            xml.loc "http://travel-guide.mobi/en/cities/travel-to/#{city.cityname}/venues/show/#{venue.name_seo}"
          end
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

    file = File.open( Rails.root.join( "sitemap_tgm.xml" ), 'w' )
    file.write( xml.xml )

    puts "TGM sitemap (in #{Rails.env}) #{Time.now}"
    puts "Cities: #{@cities.count}"
    puts "Venues: #{@cities.map { |c| c.venues.count }.reduce(:+)}"
    puts "Reports: #{@reports.count}"
    puts "Galleries: #{@galleries.count}"
  end

end
