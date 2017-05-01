
#
# api / cities / show
#

json.cache! [ @city, params ] do
  json.id             @city.id.to_s
  json.calendar_frame @city.calendar_frame
  json.cityname       @city.cityname
  json.name           @city.name
  json.features       @city.features
  json.newsitems      @newsitems

  json.reports   @city.reports
  json.galleries @city.galleries
  json.videos    @city.videos

  json.x @city.x
  json.y @city.y

end
