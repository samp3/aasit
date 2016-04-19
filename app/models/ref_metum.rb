class RefMetum < ActiveRecord::Base
  belongs_to :ref_attribute
  belongs_to :ref
  validates :ref_attribute_id, uniqueness: {scope: :ref_id}
  validates :ref_attribute_id, presence: true
  validates :ref_id, presence: true
  validates :value , presence: true
  def to_s
    ''.gsub('ä','\"{a}').gsub('ö','\"{o}')
  end
end
