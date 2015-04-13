class RenameCardToken < ActiveRecord::Migration
  def change
    rename_column :charges, :card_token, :stripe_token
  end
end
