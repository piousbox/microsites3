include ERB::Util

def puts! a, b=''
  puts "+++ +++ #{b}"
  puts a.inspect
end

class Yelp

  TAG_DENTISTS = :yelp_dentists
  USER_AGENT   = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36'
    
  def self.process_single_company args = {}
      result = HTTParty.get args[:url], :headers => { 'User-Agent' => USER_AGENT }
      result = Nokogiri::HTML(result.body)

      website       = result.css('span.biz-website a').text
      args[:lead] ||= Ish::Lead.find_by :company => args[:name]
      if !args[:lead].company_url 
        args[:lead].update_attributes( :company_url => website )
        print '>'
      end
  end

  def self.process_page page, args={}
    profile   = args[:profile] || IshModels::UserProfile.find_by( :email => 'piousbox@gmail.com' )

    companies = page.css(".regular-search-result")
    companies.each_with_index do |company, idx|
      url   = "https://yelp.com" + company.css('a.biz-name').attr('href').value
      name  = company.css('a.biz-name').text
      phone = company.css('span.biz-phone').text
      next if Ish::Lead.where( :company => name ).length != 0
      
      lead = Ish::Lead.new :tag => args[:tag], :company => name, :profile => profile,
                           :yelp_url => url, :phone => phone

      self.process_single_company( :url => url, :name => name, :lead => lead )
      
      begin
        flag = lead.save
      rescue e
        puts! e
      end
      if flag
        print "#{idx+1}."
      else
        puts! lead.errors.messages
        puts! lead.inspect
      end
    end
    puts ""
  end
  
  def self.dentists
    q       = "Dentist"
    loc     = "San Jose, CA"
    start   = 0
    max     = 100 # number of individual entries
    profile = IshModels::UserProfile.find_by :email => 'piousbox@gmail.com'

    while start < max do
      print "start #{start}: "
      url = "https://www.yelp.com/search?find_desc=#{url_encode q}&find_loc=#{url_encode loc}&start=#{start}"
      result = HTTParty.get url, :headers => { 'User-Agent' => USER_AGENT }
      self.process_page Nokogiri::HTML(result.body), :tag => Yelp::TAG_DENTISTS
      start += 10
      sleep 2
    end
  end

end

