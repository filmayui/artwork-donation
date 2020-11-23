class SaleLog < ApplicationRecord

  belongs_to :donation_project_room

  has_one_attached :image

  with_options presence: true do
    validates :artist_name
    validates :artwork_title
    validates :donation_price
    
  end
  
end
