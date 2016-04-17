json.array!(@ref_type_fields) do |ref_type_field|
  json.extract! ref_type_field, :id, :reftype_id, :ref_attribute_id, :obligatory
  json.url ref_type_field_url(ref_type_field, format: :json)
end
