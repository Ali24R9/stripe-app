class Charge < ActiveRecord::Base
  belongs_to :user
  monetize :amount_subunit, :as => "amount"

end