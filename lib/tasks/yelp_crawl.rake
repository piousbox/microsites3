require 'yelp'

namespace :yelp_crawl do

  desc "Let's start with dentists"
  task :dentists => :environment do
    Yelp.dentists
  end

end
