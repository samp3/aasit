json.array!(@refs) do |ref|
  json.extract! ref, :id, :title, :reftype_id
  json.url ref_url(ref, format: :json)
end
