Given(/^Lue seeds\.rb$/) do
  Ref.delete_all
  Reftype.delete_all
  RefAttribute.delete_all
  RefMetum.delete_all
  RefTypeField.delete_all

  load File.dirname(__FILE__) + '/../../../db/seeds.rb'
end
When(/^Käyttäjä siirtyy sivulle "([^"]*)"$/) do |url|
  visit url
end
Then(/^Käyttäjä ohjataan muokkaussivulle$/) do
  current_url.should have_content("/edit")
end
Then(/^Käyttäjä ohjataan sivulle "([^"]*)"$/) do |url|
  current_url.should have_content(url)
end
When(/^Käyttäjä valitsee kentäksi "([^"]*)"$/) do |attribute|
  select(attribute, :from => 'Kenttä')

end
When(/^Antaa lyhytnimeksi "([^"]*)"$/)  do |slug|
  fill_in 'ref[slug]', :with => slug
end
When(/^Täyttää kentät seuraavasti$/) do |table|
  table.hashes.each do |rivi |
    fill_in rivi['kentta'], with: rivi['arvo']
  end

end
Given(/^Järjestelmässä on artikkeli lyhytnimellä "([^"]*)"$/) do |slug|
  article = Reftype.find_by_name('article')
  unless article
    Reftype.create!(name: "article")
  else
  end

  Ref.create!(slug: slug, reftype_id: Reftype.find_by_name('article').id)
  @artikkeli = Ref.find_by_slug(slug)
end
When(/^Käyttäjä syöttää lyhytnimeksi "([^"]*)"$/) do |slug|
  fill_in 'ref[slug]', :with => slug
end
Given(/^Järjestelmässä ei ole viitteitä$/) do
  Ref.delete_all
end
And(/^Painaa nappia "([^"]*)"$/) do |nappi|
  click_button(nappi)
end
Then(/^Kyseinen viite poistuu järjestelmästä$/) do
  expect(page).not_to have_content("Slug can't be blank")
end
Given(/^Käyttäjä on sivulla ref_meta$/) do
  visit ref_meta_path
end
When(/^Käyttäjä painaa linkkiä "([^"]*)"$/) do |link|
  page.all(:link,link)[0].click
end

Then(/^Käyttäjä saa ilmoituksen "([^"]*)"$/) do |ilmoitus|
  page.should have_content(ilmoitus)
end
