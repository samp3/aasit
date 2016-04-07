class CreateRefs < ActiveRecord::Migration
  def change
    create_table :refs do |t|
      t.string :title
      t.integer :reftype_id

      t.timestamps null: false
    end
  end
end
