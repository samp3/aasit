# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
fields = ['address','annote','author','booktitle','chapter','crossref','edition','editor','howpublished','institution',
          'journal','key','month','note','number','organization','pages','publisher','school','series','title','type',
          'volume','year']
types = ['article','book','booklet','conference','inbook','incollection','inproceedings','manual','mastersthesis',
         'misc','phdthesis','proceedings','techreport','unpublished']

fields.each do |field|
  f = RefAttribute.new(name:field)
  f.save
end
types.each do |type|
  f = Reftype.new(name:type)
  f.save
end
ref = Ref.create!(slug:'W04', reftype_id:1)

RefMetum.create!(ref_id:ref.id,ref_attribute_id:3, value: "Whittington, Keith J.")
RefMetum.create!(ref_id:ref.id,ref_attribute_id:21, value: "Infusing active learning into introductory programming courses")
RefMetum.create!(ref_id:ref.id,ref_attribute_id:11, value: "J. Comput. Small Coll.")
RefMetum.create!(ref_id:ref.id,ref_attribute_id:23, value: "19")
RefMetum.create!(ref_id:ref.id,ref_attribute_id:15, value: "5")
RefMetum.create!(ref_id:ref.id,ref_attribute_id:24, value: "2004")
RefMetum.create!(ref_id:ref.id,ref_attribute_id:17, value: "249--259")
RefMetum.create!(ref_id:ref.id,ref_attribute_id:18, value: "Consortium for Computing Sciences in Colleges")
RefMetum.create!(ref_id:ref.id,ref_attribute_id:1, value: "USA")