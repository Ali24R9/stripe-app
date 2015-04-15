class Charge < ActiveRecord::Base
  belongs_to :user
  monetize :amount_subunit, :as => "amount", :allow_nil => true

  def cents_to_dollars
    cents = self.amount.cents.to_s
    cents = cents.insert(-2, '.')
  end
end