
Given(/^Järjestelmässä on attribuutti "([^"]*)"$/) do |name|
  RefAttribute.delete_all
  expect {
    params = { name: name, id:1}
    post "/ref_attributes.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

  }.to change{RefAttribute.count}.by(1)
end
Given(/^Artikkelilla "([^"]*)" on attribuutti "([^"]*)" jonka arvo "([^"]*)"$/) do |slug, attribute_name, valu|
  expect {
    params = { ref_attribute_id: RefAttribute.find_by_name(attribute_name).id, ref_id:  Ref.find_by_slug(slug).id, value: valu}
    post "/ref_meta.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  }.to change{RefMetum.count}.by(1)
end

When(/^Pyydän järjestelmältä listan viitteistä$/) do

    get "/refs.json", {}, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

end
Then(/^Saan listan viitteistä$/) do

  lastRef = Ref.last
  c = Hash.new

  c['id'] = lastRef.id
  c['slug'] = lastRef.slug
  c['reftype_id'] = lastRef.reftype_id

  res = JSON.parse last_response.body
  res = res[0]
  res.delete('url')
  expect(res).to eq(c)

end