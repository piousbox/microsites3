
require 'yelp'

def puts! a, b=''
  puts "+++ +++ #{b}"
  puts a.inspect
end

namespace :yelp_crawl do

  desc "Let's start with dentists"
  task :dentists => :environment do
    Yelp.dentists
  end

end
