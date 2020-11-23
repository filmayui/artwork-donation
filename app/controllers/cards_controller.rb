class CardsController < ApplicationController

  before_action :authenticate_user!

  def new
    @card = Card.new
    
  end

  def create
    
    # 環境変数を読み込む
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    
    customer = Payjp::Customer.create(
    description: 'test', # テストカードであることを説明
    card: params[:card_token] # 登録しようとしているカード情報
    )

    @card = Card.new( # トークン化されたカード情報を保存する
      card_token: params[:card_token], # カードトークン
      customer_token: customer.id, # 顧客トークン
      user_id: current_user.id # ログインしているユーザー
    )

    @card.save 

    redirect_to user_path(current_user.id)
    
  end

  def destroy

    @card = Card.find_by(user_id: current_user.id)

    if @card.blank?
      redirect_to root_path
    
    else
      @card.destroy
      redirect_to user_path(current_user.id)

    end
  end
end

