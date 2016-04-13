Given(/^Järjestelmässä on viitetyyppi "([^"]*)", jonka id on "([^"]*)"$/) do |name, id|
  Reftype.create!(name: name, id: id )
end

When(/^Käyttäjä luon viitteen, jonka lyhytnimi on "([^"]*)" ja tyyppi on "([^"]*)"$/) do |slug,type|
  @alkutila  = Ref.count
  reftype = Reftype.find_by_name(type)
  Ref.create!(slug:slug, reftype_id:reftype.id)
end
When(/^Käyttäjä luon viitteen ilman lyhyt nimeä$/) do
  @alkutila = Ref.count
  expect{Ref.create!(reftype_id:1)}.to raise_error(ActiveRecord::RecordInvalid)
end
And(/^Käyttäjä luon viitteen ilman tyyppiä$/) do
  @alkutila = Ref.count
  expect{Ref.create!(slug:"TESTI01")}.to raise_error(ActiveRecord::RecordInvalid)
end
Then(/^Järjestelmässä on yksi viite enemmän/) do
  expect(Ref.count).to eq(@alkutila +1 )
end
Then(/^Järjestelmään ei ole tallentunut uutta viitettä$/) do
  expect(Ref.count).to eq(@alkutila )
end
