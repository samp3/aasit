Given(/^Järjestelmässä on viite, jonka lyhytnimi on "([^"]*)" ja tyyppi "([^"]*)"$/)  do |slug,type|
  Reftype.create!(name: type, id:1)
  tyyppi = Reftype.find_by_name(type)
  Ref.create!(slug: slug, reftype_id: tyyppi.id)
  @artikkeli = Ref.find_by_slug(slug)
end
When(/^Käyttäjä siirtyy sivulle refs$/) do
  visit refs_path
end
Then(/^hän näkee listan järjestelmässä olevista viitteistä$/) do
  page.should have_content(@artikkeli.slug)
end

Given(/^Järjestelmässä on viitetyyppi "([^"]*)"$/) do |type|
  Reftype.create!(name: type, id:1)
end

When(/^Käyttäjä siirtyy viitteen luontisivulle$/) do
  visit new_ref_path
end
When(/^Luo artikkelin lyhytnimellä "([^"]*)"$/)  do |slug|
  fill_in 'Slug', :with => slug
  click_button('Create Ref')
end
Then(/^Käyttäjälle ilmoitetaan tapahtuman onnistumisesta ja ohjataan artikkelin sivulle$/) do
  pending
  #page.should have_content("Ref was successfully created.")
end
Then(/^Käyttäjälle ilmoitetaan tapahtuman epäonnistumisesta$/) do
  #page.should have_content("Slug can't be blank")
  pending
end
Given(/^Järjestelmässä on artikkeli lyhytnimellä "([^"]*)"$/) do |slug|
  Ref.delete_all
  Reftype.create!(name: "article", id:1)

  Ref.create!(slug: slug, reftype_id: 1)
end
And(/^Painaa nappia "destroy"$/) do

  click_link('Poista')
end
Then(/^Kyseinen viite poistuu järjestelmästä$/) do
  expect(page).not_to have_content("Slug can't be blank")
end
When(/^Käyttäjä painaa "([^"]*)"\-linkkiä, muokkaa lyhytnimeksi "([^"]*)" ja painaa painiketta Update Ref$/)  do |linkki, slug|
  pending
  #click_link(linkki)
  #fill_in 'Slug', :with => slug
  #click_button('Update Ref')
end
Then(/^Käyttäjälle ilmoitetaan päivityksen onnistumisesta$/) do
  pending
  #page.should have_content("Ref was successfully updated.")
end
Given(/^Järjestelmässä on viite, jonka lyhytnimi on "([^"]*)" ja tyyppi "([^"]*)" ja atrribuutti "([^"]*)"$/)  do |slug, type, attribute|
  Ref.delete_all
  Reftype.delete_all
  RefAttribute.delete_all
  Reftype.create!(name:type, id:1)
  Ref.create!(slug:slug, reftype_id:1)
  RefAttribute.create!(name:attribute, id:1)
end
Given(/^Käyttäjä on sivulla ref_meta$/) do
  visit ref_meta_path
end
When(/^Käyttäjä painaa linkkiä "([^"]*)"$/) do |link|
  click_link(link)
end
And(/^Käyttäjä syöttää kenttään Value "([^"]*)" ja painaa nappia "([^"]*)"$/) do |value,button|
  fill_in 'Value', :with => value
  click_button(button)
end
Then(/^Käyttäjälle ilmoitetaan onnistumisesta ja ohjataan viitteen sivulle$/) do
  page.should have_content("Ref metum was successfully created.")
end
#Update Ref
#Ref was successfully updated.
#