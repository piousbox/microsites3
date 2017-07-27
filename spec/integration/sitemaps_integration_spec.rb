require 'spec_helper'
describe 'sitemaps' do

  it 'sanity' do
    true.should eql true
  end

  it 'redirect from piousbox.com to travel-guide.mobi' do
    result = HTTParty.get( "http://localhost:8007/en/reports/abba" )
    puts! pp( result )
    raise 'not implemented'
  end

end

