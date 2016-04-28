Given(/^Järjestelmässä on viitetyyppi "([^"]*)", jonka id on "([^"]*)"$/) do |name, id|
  expect {
    params = { name: name, reftype_id:id }
    post "/reftypes.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  }.to change{Reftype.count}.by(1)

  last_response.status.should eql(201) #201 Created
end
Given(/Järjestelmässä ei ole mitään$/) do
  RefAttribute.delete_all
  RefMetum.delete_all
  Reftype.delete_all
  Ref.delete_all
end

Given(/^Järjestelmässä on attribuutti "([^"]*)", jonka id on "([^"]*)"$/) do |name, id|
  #Reftype.create!(name: name, id: id )

  expect {
    params = { name: name, reftype_id:id }
    post "/ref_attributes.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  }.to change{RefAttribute.count}.by(1)

  last_response.status.should eql(201) #201 Created
end
Given(/^Viitteille ei ole tallennettu yhtään riviä$/) do
  RefMetum.delete_all
end
Given(/^Järjestelmässä on viite, jonka lyhytnimi on "([^"]*)" ja tyyppi on "([^"]*)"$/) do |slug,type|
  step "Käyttäjä luo viitteen, jonka lyhytnimi on \"#{slug}\" ja tyyppi on \"#{type}\""
end
When(/^Käyttäjä lisää viitteeseen "([^"]*)" attribuutin "([^"]*)" arvolla "([^"]*)"$/) do |slug, attribute, value|

  createRefMetum(slug,attribute,value)

end
When(/^Käyttäjä luo viitteen, jonka lyhytnimi on "([^"]*)" ja tyyppi on "([^"]*)"$/) do |slug,type|
  @alkutila = Ref.count
  createRef(slug,type)
end
When(/^Käyttäjä luon viitteen ilman lyhyt nimeä$/) do
  @alkutila = Ref.count
  expect {
    params = { slug: '', reftype_id:1 }
    post "/refs.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

  }.to_not change{Ref.count}
  last_response.status.should eql(422) #422 Unprocessable Entity

end
Then(/^Järjestelmä palauttaa HTTP statuskoodin "([^"]*)"/) do |status|
  last_response.status.should eql(status.to_i)
end
And(/^Käyttäjä luon viitteen ilman tyyppiä$/) do
  @alkutila = Ref.count
  #expect{Ref.create!(slug:"TESTI01")}.to raise_error(ActiveRecord::RecordInvalid)

  expect {
    params = { slug: 'TESTI01'}
    post "/refs.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

  }.to_not change{Ref.count}
  last_response.status.should eql(422) #422 Unprocessable Entity
end

When(/^Käyttäjä pyytää viitteen "([^"]*)" tietoja järjestelmältä$/) do |slug|
  showRef(slug)
  @ref1 = Ref.find_by_slug(slug)
end
Then(/^Hän saa vastauksena luodun viitteen$/) do
  last_response.status.should eql(200)
  response_ref = JSON.parse(last_response.body)
  expect(response_ref['id']).to eq(@ref1.id)
  expect(response_ref['slug']).to eq(@ref1.slug)
  expect(response_ref['reftype_id']).to eq(@ref1.reftype_id)
end