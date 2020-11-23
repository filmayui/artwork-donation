class ContactsController < ApplicationController

  before_action :search_artwork, only: [:index]

  def index

  end

  private

  def search_artwork

    # 検索オブジェクトを生成
    @a = Artwork.ransack(params[:q])  

    #ActiveHachに定義されたidが０以外の各値を変数に格納
    @category = Category.where.not(id: 0)
    @main_color = MainColor.where.not(id: 0)
    @motif = Motif.where.not(id: 0)
    @feeling = Feeling.where.not(id: 0)
  end
end

