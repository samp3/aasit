json.array!(@refs) do |ref|
  json.extract! ref, :id, :slug, :reftype_id
  json.url ref_url(ref, format: :json)
end
