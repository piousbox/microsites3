require 'nokogiri'
require 'csv'

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

  desc 'export domain/lang reports; run with no params for usage'
  task :export_reports_csv => :environment do
    if !ENV['domain']
      raise "be rake ish:export_reports_csv domain=<d> [lang=<en>] [trash=true]" 
    end
    lang = ENV['lang'] || 'en'

    reports = Site.where( :domain => ENV['domain'], :lang => lang 
      ).first.reports.unscoped.where( :is_trash.in => [ false, nil ] )
    puts! reports.length, 'length'
    if ENV['trash']
      puts! reports.map { |r| r.update_attributes( :is_trash => true ) }, 'trashed?'
    end
    if reports.length > 0
      CSV.open( Rails.root.join( "#{ENV['domain']}_#{lang}_reports.csv" ), 'w' ) do |csv|
        csv << %w{ title subtitle descr created_at }
        reports.each do |r|
          csv << [ r.name, r.subhead, r.descr, r.created_at ]
        end
      end
    end
  end

  desc 'iron practice'
  task :iron_practice => :environment do
    ::Ish::IronCondorWatcher.new.new_order
  end

end
