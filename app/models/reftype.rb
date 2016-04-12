class Reftype < ActiveRecord::Base
   belongs_to :ref
   validates :name , presence: true
end
