class CreateRefTypeFields < ActiveRecord::Migration
  def change
    create_table :ref_type_fields do |t|
      t.integer :reftype_id
      t.integer :ref_attribute_id
      t.integer :obligatory

      t.timestamps null: false
    end
  end
end
