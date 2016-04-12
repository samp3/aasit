class Ref < ActiveRecord::Base
   belongs_to :reftype
   has_many :ref_metum

  validates :reftype_id, presence: true
  validates :slug , presence: true
end
