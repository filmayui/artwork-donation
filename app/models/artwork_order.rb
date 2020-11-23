class ArtworkOrder 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :artwork_id, :donation_project_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフン(-)を含めてください"}
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください'   }
    validates :city
    validates :addresses  
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "は半角数字で入力してください"}
  end

  def order

    #orderテーブルとdelivery_addressテーブルにユーザー購入情報をそれぞれ保存
    order = Order.create(user_id: user_id, artwork_id: artwork_id, donation_project_id: donation_project_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
    
  end
end
