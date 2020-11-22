class DonationProject < ApplicationRecord

  has_many :artists
  has_many :orders
  has_one :donation_project_room

  has_one_attached :image

  with_options presence: true do
    validates :project_name
    validates :text
    validates :target_amount
    validates :current_amount
    validates :image, presence: { message: 'を選択してください' }
    
  end
end
