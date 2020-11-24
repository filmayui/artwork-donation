class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @artwork = Artwork.find(params[:artwork_id])

    #購入対象が自分の登録した作品だった場合、または購入対象がordersテーブルに既に存在していた場合はトップページへ戻す
    unless current_user.id != @artwork.artist.user.id && nil == Order.find_by(artwork_id: @artwork.id)
      redirect_to root_path
    end

    # 環境変数を読み込む
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]

    #ユーザーのカード情報を取得
    @card = Card.find_by(user_id: current_user.id)

    #ユーザーがカード情報を持っていなかった場合、カード情報の登録を優先させる
    redirect_to new_card_path and return unless @card.present?

    # 先程のカード情報を元に、顧客情報を取得
    customer = Payjp::Customer.retrieve(@card.customer_token) 
    @card = customer.cards.first
    
    @artwork_order = ArtworkOrder.new

    #作品の設定金額から寄付される金額を計算
    donationPrice = @artwork.price * 0.9
    @donationPrice = donationPrice.floor
    
  end

  def create
    @artwork = Artwork.find(params[:artwork_id])
    @artwork_order = ArtworkOrder.new(order_params) 

    if @artwork_order.valid?

      #作品の設定金額から寄付される金額を計算
      donationPrice = @artwork.price * 0.9
      @donationPrice = donationPrice.floor

      #寄付されるプロジェクトの現在までの総金額に計算した金額を足し合わせる
      @donation_project = DonationProject.find_by(id: @artwork.artist.donation_project_id)
      @donation_project.current_amount = @donation_project.current_amount + @donationPrice

      #寄付されるプロジェクトの現在までの総金額を更新
      @donation_project.update(current_amount: @donation_project.current_amount)

      #orderテーブルとdelivery_addressテーブルにユーザー購入情報をそれぞれ保存
      @artwork_order.order

      #クレジットカードでの支払い処理
      pay_donation(@artwork)

      #購入された作品からアーティスト情報を検索
      artist = Artist.find_by(id: @artwork.artist.id)

      #購入ログを作成
      sale_log = SaleLog.new(artist_name: artist.artist_name, artwork_title: @artwork.title, donation_price: @donationPrice, donation_project_room_id: artist.donation_project.donation_project_room.id)

      #購入ログを保存
      sale_log.save

      redirect_to root_path
    else
      
      # 環境変数を読み込む
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]

      #ユーザーのカード情報を取得
      @card = Card.find_by(user_id: current_user.id)

      # 先程のカード情報を元に、顧客情報を取得
      customer = Payjp::Customer.retrieve(@card.customer_token) 
      @card = customer.cards.first

      render action: :index
    end
  end

  private

  def order_params
    params.require(:artwork_order).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, artwork_id: params[:artwork_id], donation_project_id: @artwork.artist.donation_project.id)
  end

  def pay_donation(artwork)

    # 環境変数を読み込む
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]

    # ログインしているユーザーの顧客トークンを定義
    customer_token = current_user.card.customer_token 
    
    Payjp::Charge.create(
      amount: artwork.price, # 商品の値段
      customer: customer_token, # 顧客のトークン
      currency: 'jpy'             
    )
  end
end

