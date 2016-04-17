class Ref < ActiveRecord::Base
  belongs_to :reftype
  has_many :ref_metum

  validates :reftype_id, presence: true
  validates :slug , presence: true

  def requiredFields?
    requiredIds = reftype.requiredFields.ids - self.ref_metum.pluck(:ref_attribute_id)
    requiredIds.length.zero?
  end
  def fields
    Hash[ref_metum.joins(:ref_attribute).pluck(:name, :value)]
  end
end
