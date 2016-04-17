class RefAttribute < ActiveRecord::Base
   has_many :ref_metum
   has_many :ref_type_fields
   validates :name , presence: true
end
