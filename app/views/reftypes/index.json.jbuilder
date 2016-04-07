json.array!(@reftypes) do |reftype|
  json.extract! reftype, :id, :name
  json.url reftype_url(reftype, format: :json)
end
