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

reftypefields['book'] = {   required:['title','publisher','year'],
                            cat2:['author','editor'],
                            optional:['volume','number','series','address','edition','month','note','key']}
reftypefields['booklet'] = {   required:['title'],
                            optional:['author','howpublished','address','month','year','note','key']}
reftypefields['conference'] = {required:['author','title','booktitle','year'],
                                  optional:['editor','volume','number','series','pages','address','month','organization','publisher','note','key']}
reftypefields['inproceedings'] = {required:['author','title','booktitle','year'],
                                  optional:['editor','volume','number','series','pages','address','month','organization','publisher','note','key']}
reftypefields['inbook'] = {   required:['title','publisher','year'],
                              cat2: ['author','editor'],
                              cat3: ['chapter','pages'],
                            optional:['volume','number','series','type','address','edition','month','note','key']}
reftypefields['incollection'] = {   required:['author','title','booktitle','publisher','year'],
                            optional:['editor','volume','number','series','type','chapter','pages','address','edition','month','note','key']}
reftypefields['manual'] = {required:['title'],
                                  optional:['author','organization','address','edition','month','year','note','key']}
reftypefields['mastersthesis'] = {required:['author', 'title', 'school', 'year'],
									optional:['type', 'address', 'month', 'note', 'key']}
reftypefields['misc'] = {optional:['author', 'title', 'howpublished', 'month', 'year', 'note', 'key']}
reftypefields['phdthesis'] = {required:['author', 'title', 'school', 'year'],
									optional:['type', 'address', 'month', 'note', 'key']}
reftypefields['proceedings'] = {required:['title','year'],
									optional:['editor','volume','number','series','address','month','publisher','organization','note','key']}
reftypefields['techreport'] = {required:['author','title','institution','year'],
									optional:['type','number','address','month','note','key']}
reftypefields['unpublished'] = {required:['author','title','note'],
									optional:['month','year','key']}

#Luodaan attribuutit
fields.each do |field|
  f = RefAttribute.create!(name:field)
end
#Luodaan tyypi
types.each do |type|
  f = Reftype.create!(name:type)
end
ref = Ref.create(slug:'W04', reftype_id:Reftype.find_by_name('article').id)
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('author').id, value: 'Whittington, Keith J.')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('title').id, value: 'Infusing active learning into introductory programming courses')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('journal').id, value: 'J. Comput. Small Coll.')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('volume').id, value: '19')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('number').id, value: '5')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('year').id, value: '2004')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('pages').id, value: '249--259')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('publisher').id, value: 'Consortium for Computing Sciences in Colleges')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('address').id, value: 'USA')

swebok = Ref.create(slug:'SWEBOK', reftype_id:Reftype.find_by_name('book').id)
RefMetum.create!(ref_id:swebok.id,ref_attribute_id:RefAttribute.find_by_name('publisher').id, value: 'IEEE Computer Society')
RefMetum.create!(ref_id:swebok.id,ref_attribute_id:RefAttribute.find_by_name('editor').id, value: 'IAbram, Aman and More, James W. and Bourgue Pierre and Dupuis Robert')
RefMetum.create!(ref_id:swebok.id,ref_attribute_id:RefAttribute.find_by_name('year').id, value: '2004}')
RefMetum.create!(ref_id:swebok.id,ref_attribute_id:RefAttribute.find_by_name('title').id, value: 'Guide to the Software Engineering Body of Knownledge')

ba04 = Ref.create(slug:'BA04', reftype_id:Reftype.find_by_name('book').id)
RefMetum.create!(ref_id:ba04.id,ref_attribute_id:RefAttribute.find_by_name('author').id, value: 'Beck, Kent and Andres, Cynthia')
RefMetum.create!(ref_id:ba04.id,ref_attribute_id:RefAttribute.find_by_name('year').id, value: '2004')
RefMetum.create!(ref_id:ba04.id,ref_attribute_id:RefAttribute.find_by_name('title').id, value: 'GExtreme Programming Explained: Embrace Change (2nd Edition)')
RefMetum.create!(ref_id:ba04.id,ref_attribute_id:RefAttribute.find_by_name('publisher').id, value: 'Addison-Wesley Professional')

royce70 = Ref.create(slug:'royce70', reftype_id:Reftype.find_by_name('inproceedings').id)
RefMetum.create!(ref_id: royce70.id,ref_attribute_id:RefAttribute.find_by_name('author').id, value: 'Beck, Kent and Andres, Cynthia')
RefMetum.create!(ref_id: royce70.id,ref_attribute_id:RefAttribute.find_by_name('title').id, value: 'GExtreme Programming Explained: Embrace Change (2nd Edition)')
RefMetum.create!(ref_id: royce70.id,ref_attribute_id:RefAttribute.find_by_name('booktitle').id, value: 'Proceedings of IEEE WESCON 26')
RefMetum.create!(ref_id: royce70.id,ref_attribute_id:RefAttribute.find_by_name('organization').id, value: 'TeX Users Group')
RefMetum.create!(ref_id: royce70.id,ref_attribute_id:RefAttribute.find_by_name('year').id, value: '1970')
RefMetum.create!(ref_id: royce70.id,ref_attribute_id:RefAttribute.find_by_name('month').id, value: 'August')
RefMetum.create!(ref_id: royce70.id,ref_attribute_id:RefAttribute.find_by_name('publisher').id, value: 'Addison-Wesley Professional')

ref= Ref.create(slug:'scrum', reftype_id:Reftype.find_by_name('article').id)
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('author').id, value: 'Whittington, Keith J.')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('title').id, value: 'Infusing active learning into introductory programming courses')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('journal').id, value: 'J. Comput. Small Coll.')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('volume').id, value: '19')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('number').id, value: '5')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('year').id, value: '2004')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('pages').id, value: '249--259')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('publisher').id, value: 'Consortium for Computing Sciences in Colleges')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('address').id, value: 'USA')

swebok = Ref.create(slug:'Martin09', reftype_id:Reftype.find_by_name('book').id)
RefMetum.create!(ref_id:swebok.id,ref_attribute_id:RefAttribute.find_by_name('publisher').id, value: 'IEEE Computer Society')
RefMetum.create!(ref_id:swebok.id,ref_attribute_id:RefAttribute.find_by_name('editor').id, value: 'IAbram, Aman and More, James W. and Bourgue Pierre and Dupuis Robert')
RefMetum.create!(ref_id:swebok.id,ref_attribute_id:RefAttribute.find_by_name('year').id, value: '2004')
RefMetum.create!(ref_id:swebok.id,ref_attribute_id:RefAttribute.find_by_name('title').id, value: 'Guide to the Software Engineering Body of Knownledge')

ref = Ref.create(slug:'fox', reftype_id:Reftype.find_by_name('article').id)
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('author').id, value: 'Whittington, Keith J.')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('title').id, value: 'Infusing active learning into introductory programming courses')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('journal').id, value: 'J. Comput. Small Coll.')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('volume').id, value: '19')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('number').id, value: '5')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('year').id, value: '2004')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('pages').id, value: '249--259')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('publisher').id, value: 'Consortium for Computing Sciences in Colleges')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('address').id, value: 'USA')

begel = Ref.create(slug:'Begel_2008', reftype_id:Reftype.find_by_name('inproceedings').id)
RefMetum.create!(ref_id: begel.id,ref_attribute_id:RefAttribute.find_by_name('author').id, value: 'Beck, Kent and Andres, Cynthia')
RefMetum.create!(ref_id: begel.id,ref_attribute_id:RefAttribute.find_by_name('title').id, value: 'GExtreme Programming Explained: Embrace Change (2nd Edition)')
RefMetum.create!(ref_id: begel.id,ref_attribute_id:RefAttribute.find_by_name('year').id, value: '1970')
RefMetum.create!(ref_id: begel.id,ref_attribute_id:RefAttribute.find_by_name('publisher').id, value: 'Amc')

ref = Ref.create(slug:'royce07', reftype_id:Reftype.find_by_name('article').id)
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('author').id, value: 'Whittington, Keith J.')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('title').id, value: 'Infusing active learning into introductory programming courses')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('journal').id, value: 'J. Comput. Small Coll.')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('volume').id, value: '19')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('number').id, value: '5')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('year').id, value: '2004')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('pages').id, value: '249--259')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('publisher').id, value: 'Consortium for Computing Sciences in Colleges')
RefMetum.create!(ref_id:ref.id,ref_attribute_id:RefAttribute.find_by_name('address').id, value: 'USA')


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
       elsif h == :cat2
         RefTypeField.create!(ref_attribute_id: ref_attribute_id, reftype_id: reftype_id, obligatory: 2)
       elsif h == :cat3
         RefTypeField.create!(ref_attribute_id: ref_attribute_id, reftype_id: reftype_id, obligatory: 3)
       else

       end
    end
  end
end

