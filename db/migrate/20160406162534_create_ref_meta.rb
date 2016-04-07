class CreateRefMeta < ActiveRecord::Migration
  def change
    create_table :ref_meta do |t|
      t.integer :ref_id
      t.integer :refAttribute_id
      t.string :value

      t.timestamps null: false
    end
  end
end
