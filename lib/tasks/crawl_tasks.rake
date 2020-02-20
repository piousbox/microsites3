require 'm3_crawler'

#
# crawl tasks
#

namespace :ish do

  desc "20180724 crawl google for emails"
  task :crawl_20180724 => :environment do
    # Rake::Task['db:mongoid:create_indexes'].invoke
    M3Crawler.crawl_20180724
  end

end
