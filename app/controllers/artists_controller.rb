class ArtistsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_artist, only: [:edit, :show, :update]
  before_action :search_artwork, only: [:index, :search, :show]

  def index
    @artists = Artist.all.order(:artist_name)

  end

  def new
    @artist = Artist.new

  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.valid?
      @artist.save

      redirect_to root_path

    else
      render :new

    end
  end

  def edit
    unless current_user.id == @artist.user.id
      redirect_to root_path
      
    end
  end

  def update
    if @artist.update(artist_params)
      redirect_to root_path

    else
      render :edit

    end
  end

  def show
    @artworks = @artist.artworks.all
    @donation_project = DonationProject.find_by(id: @artist.donation_project_id)

  end

  def search

    #ビューファイルへ表示するため検索条件を保持
    @keyword = params[:keyword]

    #パラメータから送られてきた検索条件で検索
    @results = Artist.search(@keyword)

  end

  private

  def artist_params
    params.require(:artist).permit(:artist_name, :donation_project_id, :affiliation, :personal_history, :reason_for_support_activities, :artist_message, :image).merge(user_id: current_user.id)
  end

  def set_artist
    @artist = Artist.find(params[:id])
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

