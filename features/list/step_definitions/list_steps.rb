Then(/^Saan listan viitteistä$/) do

  Ref.all.each do |ref|
    page.should have_content(ref.slug)
  end

end
Then(/^Saan listan viitetyypeistä$/) do

  Reftype.all.each do |type|
    page.should have_content(type.name)
  end

end
Then(/^Saan listan attribuuteista$/) do

  RefAttribute.all.each do |attribute|
    page.should have_content(attribute.name)
  end

end
Then(/^Saan listan tyypin "([^"]*)" attribuuteista$/) do |type|
  Reftype.find_by_name(type).ref_attributes.each do |attribute|
    page.should have_content(attribute.name)
  end

end
Then(/^saan listan viitteen "([^"]*)" attribuuteista ja arvoista$/) do |slug|
  ref = Ref.find_by_slug(slug)

  RefTypeField.where(reftype_id:ref.reftype.id).each do |f|
    attribute = f.ref_attribute
    attribute.ref_metum.where(ref_id: ref.id ).each do |m|
      page.should have_content(m.value)
      page.should have_content(attribute.name)
    end

  end

end
Then(/^hän saa lista riveistä$/) do
  RefMetum.all.each do |rm|
    page.should have_content(rm.value)
    page.should have_content(rm.ref.slug)
    page.should have_content(rm.ref_attribute.name)
  end
end
