class UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :search_artwork, only: [:show]

  def show

    @user = User.find(params[:id])

    unless current_user.id == @user.id
      redirect_to root_path

    end

    #ユーザーのidと関連する中間テーブルのレコードを全て取得
    favorites = Favorite.where(user_id: @user.id)

    @favorite_artworks = []

    #先ほど取得した中間テーブルのレコードと関連するartworkのレコードを全て取得
    favorites.each do |favorite| 
      @favorite_artworks.push(Artwork.find_by(id: favorite.artwork_id))
  
    end

    #環境変数を読み込む
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]

    #ユーザーのカード情報を取得
    @card = Card.find_by(user_id: current_user.id)

    if @card != nil

      # 先程のカード情報を元に、顧客情報を取得
      customer = Payjp::Customer.retrieve(@card.customer_token) 
      @card = customer.cards.first

    end
  end

  #お気に入り登録、または削除を行うメソッド
  def favorite
    artwork = Artwork.find(params[:id])

    #特定の組み合わせを中間テーブルから検索
    favorite = Favorite.find_by(user_id: current_user.id, artwork_id: artwork.id)

    #中間テーブルのレコードを作成したか削除したかを判別する変数を定義
    isfavorite = false

    if favorite == nil

      #検索した組み合わせが中間テーブルに存在しなかった場合、保存を行う
      Favorite.new(user_id: current_user.id, artwork_id: artwork.id).save
      
      isfavorite = true

    else

      #検索した組み合わせが既に中間テーブルに存在していた場合、削除を行う
      favorite.delete

    end

    #前のページのurlから実行する処理を分岐
    if request.referer&.include?("artwork") 
      render json: { or: isfavorite } #artwork詳細画面
    
    else
      redirect_to user_path(current_user.id) #ユーザー詳細画面
      
    end 
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

