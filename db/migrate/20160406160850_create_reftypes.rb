class CreateReftypes < ActiveRecord::Migration
  def change
    create_table :reftypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
