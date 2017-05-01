
#
# api / sites / show
#

json.cache! [ @site, params] do
  json.site do
    json.id        @site.id.to_s
    json.domain    @site.domain
    json.lang      @site.lang
    json.partial!  'api/newsitems/index', :newsitems => @newsitems
  end
end
