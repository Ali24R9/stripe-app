class ChangePriceToAmount < ActiveRecord::Migration
  def change
    rename_column :charges, :price, :amount
  end
end
