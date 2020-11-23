class SaleLog < ApplicationRecord

  belongs_to :donation_project_room

  has_one_attached :image
  
end
