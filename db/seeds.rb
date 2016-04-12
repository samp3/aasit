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
