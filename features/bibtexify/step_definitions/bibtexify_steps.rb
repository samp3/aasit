
Given(/^Järjestelmässä on viite, jonka lyhytnimi on "([^"]*)", tyyppi "([^"]*)"\. Viitteen pakolliset tiedot "([^"]*)" täytetty\.$/) do |slug,type,ok|



  tiedotOk = ok == "on"

  @required = ['author','title','journal','year','volume']
  @optional = ['number','pages','month','note','key']

  @reftype = Reftype.create(name:type)

  #Tyypin kentät ja pakolliset kentät
   @required.each do |field|
      attribute = RefAttribute.create(name:field)
      RefTypeField.create(ref_attribute_id:attribute.id, reftype_id:@reftype.id, obligatory:1)
    end
  #Vapaavalintaiset kentät
   @optional.each do |field|
      attribute = RefAttribute.create(name:field)
      RefTypeField.create(ref_attribute_id:attribute.id, reftype_id:@reftype.id, obligatory:0)
    end
  #Viite
  @ref = Ref.create(slug: slug, reftype_id:@reftype.id)

  #Rivejä
  @required.each do |ref_attribute|
    randValue = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    RefMetum.create(ref_id:@ref.id,ref_attribute_id:RefAttribute.find_by_name(ref_attribute).id,value:randValue)
  end
  unless tiedotOk
    @ref.ref_metum.last.delete
  end
end
When(/^Käyttäjä menee viitteiden sivulle ja painaa linkkiä "([^"]*)"$/) do |link|
  visit '/refs'
  click_link(link)
end
Then(/^Järjestelmä palauttaa käyttäjälle BibTeX-tiedoston$/) do
  page.response_headers['Content-Disposition'].should have_content("attachment")
  page.response_headers['Content-Type'].should  eq('application/x-bibtex')
end
When(/^RefMetum osaa antaa rivin merkkijonona$/) do
  @bib = Hash.new
  ref_meta = Ref.first.ref_metum
  ref_meta.each do |ref_metum|
    attribute, value  = /([^"]*) = { ([^"]*) }/.match(ref_metum.to_s).captures
    expect(attribute).to eq(RefAttribute.find(ref_metum.ref_attribute_id).name)
    expect(value).to eq(ref_metum.value)
    @bib[attribute] = value
  end
end
Then(/^Ref osaa antaa viitteen tiedot merkkijonona$/) do
  i =1
  @ref = Ref.first
  type = @ref.reftype.name
  @ref.to_s.each_line do |line|
    if i == 1
      r_type, r_slug = /@([^"]*)\{([^"]*)\,$/.match(line).captures
      expect(r_type).to eq(type)
      expect(r_slug).to eq(@ref.slug)
    elsif i > (@ref.ref_metum.length + 1)
      expect(line.chomp!).to eq('}')
    else
      attribute, value  = /([^"]*) = { ([^"]*) }/.match(line).captures
      expect(value).to eq(@bib[attribute])
      @bib.delete(attribute)
    end
    i += 1
  end
end

