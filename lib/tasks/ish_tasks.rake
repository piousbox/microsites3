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
  task :export_wdz_reports_xml => :environment do
    wdz = Site.where( :domain => 'webdevzine.com', :lang => :en ).first
    reports = wdz.reports.limit 2
    builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.root do
        reports.map do |r|
          xml.report do
            xml.title r.name
            xml.subtitle r.subhead
            xml.descr r.descr
          end
        end
      end
    end
    File.write( Rails.root.join('tmp.xml'), builder.to_xml )
  end

  # 20180615
  desc 'export wdz reports'
  task :export_wdz_reports_csv => :environment do

    wdz = Site.where( :domain => 'webdevzine.com', :lang => :en ).first
    reports = wdz.reports # .limit 2
    puts! reports.length, 'length'
    puts! reports.map { |r| r.update_attributes( :is_trash => true ) }, 'trashed?'
    CSV.open( Rails.root.join( 'tmp.csv' ), 'w' ) do |csv|
      csv << %w{ title subtitle descr }
      reports.each do |r|
        csv << [ r.name, r.subhead, r.descr ]
      end
    end
  end

end
