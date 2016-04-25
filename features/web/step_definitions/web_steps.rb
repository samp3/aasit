Given(/^Lue seeds\.rb$/) do
  Ref.delete_all
  Reftype.delete_all
  RefAttribute.delete_all
  RefMetum.delete_all
  RefTypeField.delete_all
#Määritellään tallennettavat attribuutit (viitteen kentät)
  fields = ['address','annote','author','booktitle','chapter','crossref','edition','editor','howpublished','institution',
            'journal','key','month','note','number','organization','pages','publisher','school','series','title','type',
            'volume','year']
#Määritellään tallennettavat tyypit
  types = ['article','book','booklet','conference','inbook','incollection','inproceedings','manual','mastersthesis',
           'misc','phdthesis','proceedings','techreport','unpublished']
#Määritellään tyypeittäin pakolliset ja valinnaiset kentät
  reftypefields = Hash.new
  reftypefields['article'] = {required:['author','title','journal','year','volume'],
                              optional:['number','pages','month','note','key']}
  reftypefields['book'] = {   required:['author','editor','title','publisher','year'],
                              optional:['volume','number','series','address','month','note','key']}
  reftypefields['inproceedings'] = {required:['author','title','booktitle','year'],
                                    optional:['editor','volume','number','series','pages','address','month','organization','publisher','note','key']}


#Luodaan attribuutit
  fields.each do |field|
    f = RefAttribute.create!(name:field)
  end
#Luodaan tyypi
  types.each do |type|
    f = Reftype.create!(name:type)
  end

#Tallennetaan tieto pakollisista ja valinnaisista kentistä
  reftypefields.keys.each do |type|

    reftypefields[type].keys.each do |h|
      reftypefields[type][h].each do |field|
        ref_attribute_id =RefAttribute.find_by_name(field).id
        reftype_id= Reftype.find_by_name(type).id

        if h == :required
          RefTypeField.create!(ref_attribute_id: ref_attribute_id, reftype_id: reftype_id, obligatory: 1)
        elsif h == :optional
          RefTypeField.create!(ref_attribute_id: ref_attribute_id, reftype_id: reftype_id, obligatory: 0)
        end
      end
    end

  end

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

Given(/^Järjestelmässä on viitetyyppi "([^"]*)"$/) do |type|
  Reftype.create!(name: type, id:1)
end

When(/^Käyttäjä siirtyy viitteen luontisivulle$/) do
  visit 'refs/new'
end
When(/^Luo artikkelin lyhytnimellä "([^"]*)"$/)  do |slug|
  fill_in 'ref[slug]', :with => slug
  click_button('Anna viitteelle tunniste ja tyyppi')
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
  article = Reftype.find_by_name('article')
  unless article
    Reftype.create!(name: "article", id:1)
  end

  Ref.create!(slug: slug, reftype_id: 1)
  @artikkeli = Ref.find_by_slug(slug)
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
Given(/^Järjestelmässä on viite, jonka lyhytnimi on "([^"]*)"$/)  do |slug|
  Ref.create!(slug:slug, reftype_id:Reftype.find_by_name('article'))
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