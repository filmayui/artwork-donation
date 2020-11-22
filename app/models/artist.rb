class Artist < ApplicationRecord
  
  belongs_to :user
  belongs_to :donation_project
  has_many :artworks, dependent: :destroy
  has_many :room_messages
  
  has_one_attached :image

  with_options presence: true do
    validates :artist_name, uniqueness: true
    validates :image, presence: { message: 'を選択してください' }
  end

  def self.search(search)

    #文字列部分一致で検索
    Artist.where(['artist_name LIKE ?', "%#{search}%"] )
   
  end
end

