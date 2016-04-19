class Ref < ActiveRecord::Base
  belongs_to :reftype
  has_many :ref_metum, dependent: :destroy

  validates :reftype_id, presence: true
  validates :slug , presence: true

  def requiredFields?
    requiredIds = reftype.requiredFields.ids - self.ref_metum.pluck(:ref_attribute_id)
    requiredIds.length.zero?
  end
  def fields
    Hash[ref_metum.joins(:ref_attribute).pluck(:name, :value)]
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
end
