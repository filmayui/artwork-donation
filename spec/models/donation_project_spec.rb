require 'rails_helper'

RSpec.describe DonationProject, type: :model do
  before do
    @donation_project = FactoryBot.build(:donation_project)
    @donation_project.image = fixture_file_upload('app/assets/images/force-of-will.jpg')
  end
  describe '支援プロジェクト登録' do
    it '全ての入力内容が満たされている時に登録できる' do
      expect(@donation_project).to be_valid
    end
    it 'imageが空だと登録できない' do
      @donation_project.image = nil
      @donation_project.valid?
      expect(@donation_project.errors.full_messages).to include("プロジェクト画像を選択してください")
    end
    it 'project_nameが空だと登録できない' do
      @donation_project.project_name = ''
      @donation_project.valid?
      expect(@donation_project.errors.full_messages).to include("プロジェクト名を入力してください")
    end
    it 'textが空だと登録できない' do
      @donation_project.text = ''
      @donation_project.valid?
      expect(@donation_project.errors.full_messages).to include("プロジェクトの概要を入力してください")
    end
    it 'target_amountが空だと登録できない' do
      @donation_project.target_amount = ''
      @donation_project.valid?
      expect(@donation_project.errors.full_messages).to include("目標金額を入力してください")
    end
    it 'target_amountの範囲が¥10000~¥10000000の間でないと登録できない(下限値）' do
      @donation_project.target_amount = 1
      @donation_project.valid?
      expect(@donation_project.errors.full_messages).to include('目標金額は範囲内の数値を入力してください')
    end
    it 'target_amountの範囲が¥10000~¥10000000の間でないと登録できない(上限値)' do
      @donation_project.target_amount = 99999999
      @donation_project.valid?
      expect(@donation_project.errors.full_messages).to include('目標金額は範囲内の数値を入力してください')
    end
    it 'target_amountが半角数字以外であれば登録できない' do
      @donation_project.target_amount = 'あああ'
      @donation_project.valid?
      expect(@donation_project.errors.full_messages).to include('目標金額は範囲内の数値を入力してください')
    end
  end
end
