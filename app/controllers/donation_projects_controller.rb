class DonationProjectsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :search_artwork, only: [:index, :search, :show]

  def index
    @donation_projects = DonationProject.all.order(created_at: "DESC")

  end

  def new

    #ユーザーに管理者権限が付与されていなかった場合、トップページに戻す
    unless current_user.admin == true
      redirect_to root_path
      
    end

    @donation_project = DonationProject.new

  end

  def create
    @donation_project = DonationProject.new(donation_project_params)

    if @donation_project.valid?
      @donation_project.save

      
      donation_project_room = DonationProjectRoom.new(donation_project_id: @donation_project.id)
      donation_project_room.save

      redirect_to root_path

    else
      render :new
      
    end
  end

  private

  def donation_project_params
    params.require(:donation_project).permit(:project_name, :text, :target_amount, :image)
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
