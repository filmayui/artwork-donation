class DonationProject < ApplicationRecord

  has_many :artists
  has_many :orders
  has_one :donation_project_room

  has_one_attached :image

  with_options presence: true do
    validates :project_name
    validates :text
    validates :target_amount, inclusion: { in: 10000..10000000, message: 'は範囲内の数値を入力してください' }, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
    validates :current_amount
    validates :image, presence: { message: 'を選択してください' }
    
  end
end
