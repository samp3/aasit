require 'test_helper'

class RefTest < ActiveSupport::TestCase
  test "Luo Referenssi" do
    ref = Ref.new(slug:"Testi")
    assert ref.save, "Tallenna"
   end
end
