class EditCharges < ActiveRecord::Migration
  def change
    rename_column :charges, :user_id, :customer_id
  end
end
