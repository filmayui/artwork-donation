class DonationProjectRoomsController < ApplicationController

  before_action :authenticate_user!

  def show

    #アーティストの指定している支援プロジェクトを取得
    @donation_project = DonationProject.find(params[:id])

    #アーティストの指定している支援プロジェクトに対応するルームを取得
    @donation_project_room = DonationProjectRoom.find_by(donation_project_id: @donation_project.id)

    #自分と同じ支援プロジェクトを指定しているアーティストを全て取得
    @artists = Artist.where(donation_project_id: @donation_project.id)

    #ルームメッセージのインスタンス作成
    @room_message = RoomMessage.new

    #支援プロジェクトルームのメッセージを全て取得
    @room_messages = RoomMessage.where(donation_project_room_id: @donation_project_room.id)

    #支援プロジェクトルームに紐づく購入ログを全て取得
    @sale_logs = SaleLog.where(donation_project_room_id: @donation_project_room.id)

  end

end

