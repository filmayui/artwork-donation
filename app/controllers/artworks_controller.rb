class ArtworksController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_artwork, only: [:edit, :show, :update, :destroy]
  before_action :search_artwork, only: [:index, :search, :show]

  def index
    @artworks = Artwork.all.order(created_at: "DESC")
    
  end

  def new
    @artwork = Artwork.new
    @donation_project = DonationProject.find_by(id: current_user.artist.donation_project_id)

  end

  def create
    @artwork = Artwork.new(artwork_params)
    
    if @artwork.valid?
      @artwork.save
      redirect_to root_path
      
    else
      @donation_project = DonationProject.find_by(id: current_user.artist.donation_project_id)
      render :new
      
    end
  end

  def edit
    unless current_user.id == @artwork.artist.user.id
      redirect_to root_path

    end

    @donation_project = DonationProject.find_by(id: current_user.artist.donation_project_id)
    
  end

  def update
    if @artwork.update(artwork_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @artwork.artist.user.id
      @artwork.destroy
      redirect_to root_path

    else
      redirect_to root_path

    end
  end

  def show
    @artist = Artist.find_by(id: @artwork.artist.id)

    @comment = Comment.new
    @comments = @artwork.comments.includes(:user)

    #作品の設定金額から寄付される金額を計算
    donationPrice = @artwork.price * 0.9
    @donationPrice = donationPrice.floor

    #作品のお気に入り登録数を計算
    @favoriteCount = Favorite.where(artwork_id: @artwork.id).count

  end

  def search

    #検索結果を変数に格納
    @results = @a.result
    
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :size, :text, :price, :category_id, :main_color_id, :motif_id, :feeling_id, :prefecture_id, :scheduled_delivery_id, :image).merge(artist_id: current_user.artist.id)
  end

  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

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
