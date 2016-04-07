class RefMetum < ActiveRecord::Base
   belongs_to :ref_attribute
   belongs_to :ref
end
