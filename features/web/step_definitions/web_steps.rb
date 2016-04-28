Given(/^Lue seeds\.rb$/) do
  Ref.delete_all
  Reftype.delete_all
  RefAttribute.delete_all
  RefMetum.delete_all
  RefTypeField.delete_all

  load File.dirname(__FILE__) + '/../../../db/seeds.rb'
end
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

When(/^Käyttäjä siirtyy viitteen luontisivulle$/) do
  visit 'refs/new'
end
When(/^Luo artikkelin lyhytnimellä "([^"]*)"$/)  do |slug|
  fill_in 'ref[slug]', :with => slug
  click_button('Anna viitteelle tunniste ja tyyppi')
end
Given(/^Järjestelmässä on artikkeli lyhytnimellä "([^"]*)"$/) do |slug|
  article = Reftype.find_by_name('article')
  unless article
    Reftype.create!(name: "article", id:Reftype.find_by_name('article').id)
  else
  end

  Ref.create!(slug: slug, reftype_id: 1)
  @artikkeli = Ref.find_by_slug(slug)
end
Given(/^Järjestelmässä ei ole viitteitä$/) do
  Ref.delete_all
end
And(/^Painaa nappia "([^"]*)"$/) do |nappi|
  click_link(nappi)
end
Then(/^Kyseinen viite poistuu järjestelmästä$/) do
  expect(page).not_to have_content("Slug can't be blank")
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
  page.should have_content("Tuntamaton lyhytnimi")
end
#Update Ref
#Ref was successfully updated.
#