class ChangeRefAttribute < ActiveRecord::Migration
  def change
     remove_column :ref_meta , :refAttribute_id
     add_column :ref_meta , :ref_attribute_id, :integer
  end
end
