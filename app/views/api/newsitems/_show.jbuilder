
n ||= newsitem

json.cache! [ n, params ] do
  json.id         n.id.to_s
  json.created_at n.created_at

  json.name       n.name
  json.descr      n.descr

  # json.rest       n
end
