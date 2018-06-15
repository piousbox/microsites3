require 'nokogiri'
require 'csv'

def puts! a, b=''
  puts "+++ +++ #{b}"
  puts a.inspect
end

namespace :ish do

  desc "migrate"
  task :migrate => :environment do
    # create indexes
    Rake::Task['db:mongoid:create_indexes'].invoke
  end

  # 20180615
  desc 'export wdz reports'
  task :export_wdz_reports_csv => :environment do
    reports = Site.where( :domain => 'webdevzine.com', :lang => :en ).first.reports
    puts! reports.length, 'length'
    # puts! reports.map { |r| r.update_attributes( :is_trash => true ) }, 'trashed?'
    CSV.open( Rails.root.join( 'tmp.csv' ), 'w' ) do |csv|
      csv << %w{ title subtitle descr created_at }
      reports.each do |r|
        csv << [ r.name, r.subhead, r.descr, r.created_at ]
      end
    end
  end

  # 20180615
  desc 'trash wdz reports'
  task :trash_wdz_reports => :environment do
    reports = Site.where( :domain => 'webdevzine.com', :lang => :en ).first.reports
    puts! reports.length, 'length'
    puts! reports.map { |r| r.update_attributes( :is_trash => true ) }, 'trashed?'
  end

end
