class Reftype < ActiveRecord::Base
   belongs_to :ref, dependent: :destroy
   validates :name , presence: true
   has_many :ref_type_fields, dependent: :destroy
   has_many :ref_attributes, through: :ref_type_fields

  def requiredFields
     getFields(1)
  end
   def required2Fields
     getFields(2)
   end
   def required3Fields
     getFields(3)
   end
   def requiredFieldsIds
     requiredFields.ids
   end
   def requiredFields2Ids
     required2Fields.ids
   end
   def requiredFields3Ids
     required3Fields.ids
   end
   def hasFields
     not requiredFields.empty?
   end
  def optionalFields
     getFields(0)
  end
   def optionalFieldsIds
     optionalFields.ids
   end
  private
  def getFields(cat)
    ref_attributes.where('obligatory = '+cat.to_s)
  end
end
