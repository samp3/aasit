json.array!(@ref_attributes) do |ref_attribute|
  json.extract! ref_attribute, :id, :name
  json.url ref_attribute_url(ref_attribute, format: :json)
end
