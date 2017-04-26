
json.cache! [ @report, params ] do
  json.id         @report.id.to_s
  json.name       @report.name
  json.name_seo   @report.name_seo
  json.created_at @report.created_at
  json.updated_at @report.updated_at
  json.descr      @report.descr
end
