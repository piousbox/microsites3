
IshModels.configure do |config|
  File.open('/tmp/this', 'a') { |f| f.puts "#{Time.now} - IshModels.configure in microsites3_api" }
  config.s3_credentials = ::S3_CREDENTIALS
end
