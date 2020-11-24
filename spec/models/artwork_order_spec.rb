require 'rails_helper'

RSpec.describe ArtworkOrder, type: :model do
  before do
    @artwork_order = FactoryBot.build(:artwork_order)
  end
  describe '購入情報登録' do
    it '全ての入力内容が満たされている時に登録できる' do
      expect(@artwork_order).to be_valid
    end
    it 'buildingが空でも登録できる' do
      @artwork_order.building = ''
      expect(@artwork_order).to be_valid
    end
    it 'postal_codeが空だと登録できない' do
      @artwork_order.postal_code = ''
      @artwork_order.valid?
      expect(@artwork_order.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'postal_codeにハイフン(-)がないと登録できない' do
      @artwork_order.postal_code = '0000000'
      @artwork_order.valid?
      expect(@artwork_order.errors.full_messages).to include("郵便番号はハイフン(-)を含めてください")
    end
    it 'prefecture_idが0だと登録できない' do
      @artwork_order.prefecture_id = 0
      @artwork_order.valid?
      expect(@artwork_order.errors.full_messages).to include("都道府県を選択してください")
    end
    it 'cityが空だと登録できない' do
      @artwork_order.city = ''
      @artwork_order.valid?
      expect(@artwork_order.errors.full_messages).to include("市区町村を入力してください")
    end
    it 'addressesが空だと登録できない' do
      @artwork_order.addresses = ''
      @artwork_order.valid?
      expect(@artwork_order.errors.full_messages).to include("番地を入力してください")
    end
    it 'phone_numberが空だと登録できない' do
      @artwork_order.phone_number = ''
      @artwork_order.valid?
      expect(@artwork_order.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'phone_numberが半角数字でないと登録できない' do
      @artwork_order.phone_number = 'あああああ'
      @artwork_order.valid?
      expect(@artwork_order.errors.full_messages).to include("電話番号は半角数字で入力してください")
    end
  end
end
