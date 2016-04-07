class Ref < ActiveRecord::Base
   belongs_to :reftype
   has_many :ref_metum
end
