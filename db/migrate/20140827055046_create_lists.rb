class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.references :user, index: true
      t.integer :sort_order

      t.timestamps null: false
    end
  end
end
