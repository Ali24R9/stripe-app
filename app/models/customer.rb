class Customer < ActiveRecord::Base
  validates :first_name, :last_name, :email, :address, :country, :subregion, :phone, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_many :charges

end