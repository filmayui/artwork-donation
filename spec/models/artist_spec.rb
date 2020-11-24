require 'rails_helper'

RSpec.describe Artist, type: :model do
  before do
    @artist = FactoryBot.build(:artist)
    @donation_project = FactoryBot.build(:donation_project)
    @artist.image = fixture_file_upload('app/assets/images/force-of-will.jpg')
    @artist.donation_project_id = @donation_project.id
  end
  describe 'アーティスト情報登録' do
    it '全ての入力内容が満たされている時に登録できる' do
      expect(@artist).to be_valid
    end
    it 'imageが空だと登録できない' do
      @artist.image = nil
      @artist.valid?
      expect(@artist.errors.full_messages).to include("アーティスト画像を選択してください")
    end
    it 'artist_nameが空だと登録できない' do
      @artist.artist_name = ''
      @artist.valid?
      expect(@artist.errors.full_messages).to include("アーティスト名を入力してください")
    end
  end
end
