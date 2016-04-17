Given(/^Järjestelmässä on viitetyyppi "([^"]*)", jonka id on "([^"]*)"$/) do |name, id|
  #Reftype.create!(name: name, id: id )
  expect {
    params = { name: name, reftype_id:id }
    post "/reftypes.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  }.to change{Reftype.count}.by(1)

  last_response.status.should eql(201) #201 Created
end
Given(/^Järjestelmässä on attribuutti "([^"]*)", jonka id on "([^"]*)"$/) do |name, id|
  #Reftype.create!(name: name, id: id )
  RefAttribute.delete_all
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

  expect {
    params = { ref_id: Ref.find_by_slug(slug).id,
               ref_attribute_id: RefAttribute.find_by_name(attribute).id,
               value: value }
    post "/ref_meta.json", params.to_json,
         { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

  }.to change{RefMetum.count}.by(1)
  last_response.status.should eql(201)
end
When(/^Käyttäjä luo viitteen, jonka lyhytnimi on "([^"]*)" ja tyyppi on "([^"]*)"$/) do |slug,type|
  @alkutila = Ref.count
  #Ref.create!(slug:slug, reftype_id:reftype.id)
  expect {
  params = { slug: slug, reftype_id: Reftype.find_by_name(type).id }
  post "/refs.json", params.to_json,
       { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

  }.to change{Ref.count}.by(1)


end
When(/^Käyttäjä luon viitteen ilman lyhyt nimeä$/) do
  @alkutila = Ref.count
  #expect{Ref.create!(reftype_id:1)}.to raise_error(ActiveRecord::RecordInvalid)
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
Then(/^Järjestelmässä on yksi viite enemmän/) do
  expect(Ref.count).to eq(@alkutila +1 )
end
Then(/^Järjestelmään ei ole tallentunut uutta viitettä$/) do
  expect(Ref.count).to eq(@alkutila )
end
