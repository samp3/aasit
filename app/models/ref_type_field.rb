class RefTypeField < ActiveRecord::Base
  validates :ref_attribute_id, presence: true, uniqueness: {scope: :reftype_id}
  validate :validate_ref_attribute_id
  validates :reftype_id, presence: true
  validate :validate_reftype_id
  validates :obligatory, presence: true
  belongs_to :reftype
  belongs_to :ref_attribute

  def required?
    obligatory == 1
  end
  private
  def validate_reftype_id
    errors.add(:reftype_id, "is invalid") unless Reftype.exists?(self.reftype_id)
  end
  def validate_ref_attribute_id
    errors.add(:ref_attribute_id, "is invalid") unless RefAttribute.exists?(self.ref_attribute_id)
  end
end
