class Artwork < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :artist
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_one :order

  belongs_to_active_hash :category
  belongs_to_active_hash :main_color
  belongs_to_active_hash :motif
  belongs_to_active_hash :feeling
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :size
    validates :text
    validates :price, inclusion: { in: 1000..9999999, message: 'は範囲内の数値を入力してください' }, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
    validates :category_id,             numericality: { other_than: 0, message: 'を選択してください' }
    validates :main_color_id,           numericality: { other_than: 0, message: 'を選択してください'  }
    validates :motif_id,                numericality: { other_than: 0, message: 'を選択してください'  }
    validates :feeling_id,              numericality: { other_than: 0, message: 'を選択してください'  }
    validates :prefecture_id,           numericality: { other_than: 0, message: 'を選択してください'  }
    validates :scheduled_delivery_id,   numericality: { other_than: 0, message: 'を選択してください'  }
    validates :image, presence: { message: 'を選択してください' }
    
  end
end
