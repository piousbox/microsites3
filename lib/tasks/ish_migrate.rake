

namespace :ish_migrate do

  desc "gallery -> gallery2"
  task :gallery_gallery2 => :environment do
    pi = Site.find_by( :domain => 'piousbox.com', :lang => :en )
    Gallery.unscoped.each do |g|
      g = g.attributes
      # g[:profile] = g[:user_profile]
      [ :_type, :user_id, :is_anonymous ].each { |field| g.delete field }
      
      begin
        Site.find g[:site_id]
      rescue Mongoid::Errors::DocumentNotFound, Mongoid::Errors::InvalidFind
  	g[:site_id] = pi.id
      end
      g2 = Gallery2.new g
      flag = g2.save
      flag ? print('.') : puts!( g2.errors.messages, "Cannot save Gallery2 :: #{g.galleryname}" )
    end
  end

end
