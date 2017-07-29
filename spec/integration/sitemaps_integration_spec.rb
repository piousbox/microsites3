require 'spec_helper'
describe 'sitemaps' do
  before :each do
    @from_domain = 'pi.local'
    @to_domain = 'travel-guide.mobi'
    @paths = [ [ '/en/galleries/show_long/a',   '/en/galleries/show/a' ],
               [ '/en/galleries/show/a',        '/en/galleries/show/a' ],
               [ '/en/galleries/show_long/a/0', '/en/galleries/show/a/0' ],
               [ '/en/galleries/show/a/0',      '/en/galleries/show/a/0' ],
               [ '/en/reports/view/r',          '/en/reports/show/r' ],

               [ '/ru/galleries/show_long/a',   '/ru/galleries/show/a' ],
               [ '/ru/galleries/show/a',        '/ru/galleries/show/a' ],
               [ '/ru/galleries/show_long/a/0', '/ru/galleries/show/a/0' ],
               [ '/ru/galleries/show/a/0',      '/ru/galleries/show/a/0' ],
               [ '/ru/reports/view/r',          '/ru/reports/show/r' ],
 
               [ '/pt/galleries/show_long/a',   '/pt/galleries/show/a' ],
               [ '/pt/galleries/show/a',        '/pt/galleries/show/a' ],
               [ '/pt/galleries/show_long/a/0', '/pt/galleries/show/a/0' ],
               [ '/pt/galleries/show/a/0',      '/pt/galleries/show/a/0' ],
               [ '/pt/reports/view/r',          '/pt/reports/show/r' ]
             ]
  end

  it 'redirect from piousbox.com to travel-guide.mobi' do
    @paths.each do |from_path, to_path|
      result = HTTParty.get( "http://#{@from_domain}#{from_path}", :follow_redirects => false )
      result.headers['location'].should eql "http://#{@to_domain}#{to_path}"
      result.code.should eql 301
    end
  end

end

