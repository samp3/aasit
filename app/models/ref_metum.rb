class RefMetum < ActiveRecord::Base
  belongs_to :ref_attribute
  belongs_to :ref
  validates :ref_attribute_id, presence: true, uniqueness: {scope: :ref_id}

  validate :validate_ref_attribute_id
  validate :validate_ref_id
  validates :ref_id, presence: true
  validates :value , presence: true
  def to_s
    output = self.ref_attribute.name + ' = { '+ self.value + ' }'
    return output.gsub('ä','\"{a}').gsub('ö','\"{o}')
  end


  private

  def validate_ref_attribute_id
    errors.add(:ref_attribute_id, "is invalid") unless RefAttribute.exists?(self.ref_attribute_id)
  end
  def validate_ref_id
    errors.add(:ref_id, "is invalid") unless Ref.exists?(self.ref_id)
  end
end
