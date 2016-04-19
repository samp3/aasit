class RefAttribute < ActiveRecord::Base
   has_many :ref_metum, dependent: :destroy
   has_many :ref_type_fields, dependent: :destroy
   validates :name , presence: true
end
