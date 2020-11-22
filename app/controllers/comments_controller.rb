class CommentsController < ApplicationController
  before_action :search_artwork, only: [:create]
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
    
      @comment.save

      #ユーザーがアーティスト名を持っていればアーティスト名を、持っていなければユーザー名を変数に格納
      if nil == Artist.find_by(user_id: @comment.user.id) 
        who = @comment.user.nickname
      else
        who = @comment.user.artist.artist_name
      end 

      #コメントの本文、ユーザー名またはアーティスト名、現在の日時情報を設定し非同期通信
      ActionCable.server.broadcast 'comment_channel', content: @comment.text, who: who, time: @comment.created_at.strftime("%Y/%m/%d %H:%M:%S")
      
    else

      redirect_to artwork_path(params[:artwork_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, artwork_id: params[:artwork_id]) 
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

