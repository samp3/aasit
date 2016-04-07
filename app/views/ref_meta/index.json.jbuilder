json.array!(@ref_meta) do |ref_metum|
  json.extract! ref_metum, :id, :ref_id, :refAttribute_id, :value
  json.url ref_metum_url(ref_metum, format: :json)
end
