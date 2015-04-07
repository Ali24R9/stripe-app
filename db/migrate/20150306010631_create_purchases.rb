class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :name
      t.decimal :price
      t.integer :user_id
      t.boolean :subscribed

      t.timestamps
    end
  end
end
