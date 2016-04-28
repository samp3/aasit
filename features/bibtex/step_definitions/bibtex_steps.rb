Then(/^järjestelmään on tallentunut viitetyypit:$/)  do |reftypes|

  list = reftypes.split(/,\s/)
  list.each do |type|
        expect(Reftype.find_by_name(type)).to_not eq(nil)
  end
  expect(Reftype.all.length).to eq(14)
end
Then(/^järjestelmään on tallentunut attribuuttit:$/) do |attributes|
  list = attributes.split(/,\s/)
  list.each do |attribute|
    expect(RefAttribute.find_by_name(attribute)).to_not eq(nil)
  end
  expect(RefAttribute.all.length).to eq(24)
end
Then(/^viitetyypillä "([^"]*)" on pakolliset kentät:$/) do |type, fields|
  @reftype = Reftype.find_by_name(type)
  required = @reftype.requiredFields
  list = fields.split(/,\s/)
  loopFields(list,required)
end
Then(/^vapaavalintaset kentät:$/) do |fields|
  list = fields.split(/,\s/)
  optional = @reftype.optionalFields
  loopFields(list,optional)
end

def loopFields(list1, req_opt)
  list1.each do |field|
    ref_attribute = req_opt.find_by_name(field)
    expect(ref_attribute).to_not eq(nil)
    req_opt.delete(ref_attribute)
  end
  expect(req_opt.length).to eq(0)
end
