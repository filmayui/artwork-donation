require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe 'コメント登録' do
    it '全ての入力内容が満たされている時に登録できる' do
      expect(@comment).to be_valid
    end
    it 'textが空だと登録できない' do
      @comment.text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("コメントを入力してください")
    end
  end
end
