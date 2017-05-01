
json.newsitems newsitems do |n|
  json.partial! 'api/newsitems/show', :newsitem => n  
end

