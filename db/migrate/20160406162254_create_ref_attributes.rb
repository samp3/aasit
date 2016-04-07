class CreateRefAttributes < ActiveRecord::Migration
  def change
    create_table :ref_attributes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
