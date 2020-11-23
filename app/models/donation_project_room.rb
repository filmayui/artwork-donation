class DonationProjectRoom < ApplicationRecord

  belongs_to :donation_project
  has_many :room_messages
  has_many :sale_logs
  
end

