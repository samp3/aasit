class Ref < ActiveRecord::Base
  belongs_to :reftype
  has_many :ref_metum, dependent: :destroy
  has_many :ref_attributes, through: :ref_metum
  validates :reftype_id, presence: true
  validate :validate_reftype_id
  validates :slug, presence: true, uniqueness: true

  def requiredFields?
    requiredIds = reftype.requiredFields.ids - self.ref_metum.pluck(:ref_attribute_id)
    requiredIds.length.zero?
  end
  def to_s
    output = "@#{self.reftype.name}{#{slug},\n"
    self.ref_metum.each do | meta|
      output += meta.to_s
      if meta == self.ref_metum.last
        output += "\n"
      else
        output += ",\n"
      end
    end
    output += "}\n"
    return output
  end
  private
  def validate_reftype_id
    errors.add(:reftype_id, "is invalid") unless Reftype.exists?(self.reftype_id)
  end
end
