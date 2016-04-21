# :nocov:
def createReftype(name)
  expect {
    params = { name: name }
    post "/reftypes.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  }.to change{Reftype.count}.by(1)
end
def createRef(slug,type)

    params = { slug: slug, reftype_id:Reftype.find_by_name(type).id }
    post "/refs.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

end
def create_ref_with_expect(slug, type, amount=1)
  expect {
    createRef(slug,type)
  }.to change{Ref.count}.by(amount)
end
def createRefAttribute(name)
  expect {
    params = { name: name, }
    post "/ref_attributes.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  }.to change{RefAttribute.count}.by(1)
end
def createRefTypeField(ref_attribute,reftype,required)
  expect {
    params = { ref_attribute_id: RefAttribute.find_by_name(ref_attribute).id, reftype_id:Reftype.find_by_name(reftype).id,obligatory:required }
    post "/ref_type_fields.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  }.to change{RefTypeField.count}.by(1)
end
def processRefTypeField(field,type,required)
  attribute = RefAttribute.find_by_name(field)
  unless attribute
    createRefAttribute(field)
  end
  createRefTypeField(field,type,required)
end
def createRefMetumWithExpect(ref,ref_attribute,value)
  expect {
    createRefMetum(ref,ref_attribute,value)
  }.to change{RefMetum.count}.by(1)
end
def createRefMetum(ref,ref_attribute,value)
    ref_attribute = RefAttribute.find_by_name(ref_attribute)
    params = { ref_attribute_id: ref_attribute.id, ref_id: Ref.find_by_slug(ref).id,value: value }
    post "/ref_meta.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
end
# :nocov: