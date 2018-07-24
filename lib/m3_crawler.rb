
def puts! a, b=''
  puts "+++ +++ #{b}"
  puts a.inspect
end

class M3Crawler

  def self.crawl_20180724
    leads = Ish::Lead.where( :email.in => [ '', nil ] )
    leads = leads.where( :tag => 'hired_com_ror', :description.in => [ '', nil ], :extra.nin => [ "20180724" ] )
    leads = leads.limit( 100 ).skip( 12 )

    leads.each_with_index do |lead, idx|
      puts idx
      attrs = {}

      args = Ish::Crawler.google_first_result( lead.company )
      attrs[:website_html] = args[:html]
      attrs[:company_url] = args[:url]
      email = Ish::Crawler.look_for_emails( args[:html] )

      puts! email, 'email'

      if email
        attrs[:email] = email 
      end
      lead.update_attributes( attrs )
      lead.extra.push "20180724"
      lead.save

      sleep 1 + rand * 2 # between 1 and 3 seconds
    end
  end

end
