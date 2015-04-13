class RenameAmount < ActiveRecord::Migration
  def change
    rename_column :charges, :amount, :amount_subunit
  end
end
