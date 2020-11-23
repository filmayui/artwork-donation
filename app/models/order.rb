class Order < ApplicationRecord

  belongs_to :user
  belongs_to :artwork
  belongs_to :donation_project
  has_one :delivery_address

end

