class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :country
      t.string :subregion
      t.string :zip_code
      t.string :email
      t.string :phone
    end
  end
end
