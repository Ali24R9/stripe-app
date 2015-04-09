class RenamePurchases < ActiveRecord::Migration
  def change
    rename_table :purchases, :charges
  end
end
