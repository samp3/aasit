class Reftype < ActiveRecord::Base
   belongs_to :ref
   validates :name , presence: true
   has_many :ref_type_fields
   has_many :ref_attributes, through: :ref_type_fields

  def requiredFields
     ref_attributes.where("obligatory = 1")
  end
   def requiredFieldsIds
     requiredFields.ids
   end
  def optionalFields
     ref_attributes.where("obligatory = 0")
  end
   def optionalFieldsIds
     optionalFields.ids
   end
end
