require 'rails_helper'

RSpec.describe RoomMessage, type: :model do
  before do
    @room_message = FactoryBot.build(:room_message)
  end
  describe 'ルームメッセージ登録' do
    it '全ての入力内容が満たされている時に登録できる' do
      expect(@room_message).to be_valid
    end
    it 'textが空だと登録できない' do
      @room_message.text = ''
      @room_message.valid?
      expect(@room_message.errors.full_messages).to include("ルームメッセージを入力してください")
    end
  end
end
