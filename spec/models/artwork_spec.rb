require 'rails_helper'

RSpec.describe Artwork, type: :model do
  before do
    @artwork = FactoryBot.build(:artwork)
    @artwork.image = fixture_file_upload('app/assets/images/force-of-will.jpg')
  end
  describe '作品情報登録' do
    it '全ての入力内容が満たされている時に登録できる' do
      expect(@artwork).to be_valid
    end
    it 'imageが空だと登録できない' do
      @artwork.image = nil
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include("作品画像を選択してください")
    end
    it 'titleが空だと登録できない' do
      @artwork.title = ''
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include("作品名を入力してください")
    end
    it 'textが空だと登録できない' do
      @artwork.text = ''
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include("作品の説明を入力してください")
    end
    it 'sizeが空だと登録できない' do
      @artwork.size = ''
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include("サイズを入力してください")
    end
    it 'category_idが0だと登録できない' do
      @artwork.category_id = 0
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include('カテゴリーを選択してください')
    end
    it 'main_color_idが0だと登録できない' do
      @artwork.main_color_id = 0
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include('メインカラーを選択してください')
    end
    it 'motif_idが0だと登録できない' do
      @artwork.motif_id = 0
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include('モチーフを選択してください')
    end
    it 'feeling_idが0だと登録できない' do
      @artwork.feeling_id = 0
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include('フィーリングを選択してください')
    end
    it 'prefecture_idが0だと登録できない' do
      @artwork.prefecture_id = 0
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include('発送元の地域を選択してください')
    end
    it 'scheduled_delivery_idが0だと登録できない' do
      @artwork.scheduled_delivery_id = 0
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include('発送日の目安を選択してください')
    end
    it 'priceが空だと登録できない' do
      @artwork.price = ''
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include("設定価格を入力してください")
    end
    it 'priceの範囲が¥1000~¥9999999の間でないと登録できない(下限値）' do
      @artwork.price = 1
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include('設定価格は範囲内の数値を入力してください')
    end
    it 'priceの範囲が¥1000~¥9999999の間でないと登録できない(上限値)' do
      @artwork.price = 99999999
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include('設定価格は範囲内の数値を入力してください')
    end
    it 'priceが半角数字以外であれば登録できない' do
      @artwork.price = 'あああ'
      @artwork.valid?
      expect(@artwork.errors.full_messages).to include('設定価格は範囲内の数値を入力してください')
    end
  end
end
