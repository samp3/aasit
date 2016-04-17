class RefTypeField < ActiveRecord::Base
  validates :ref_attribute_id, presence: true
  validates :reftype_id, presence: true
  validates :obligatory, presence: true
  belongs_to :reftype
  belongs_to :ref_attribute

  def required?
    obligatory == 1
  end
end
