class RefAttribute < ActiveRecord::Base
   has_many :ref_metum
   validates :name , presence: true
end
