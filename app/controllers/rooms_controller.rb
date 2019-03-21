class RoomsController < ApplicationController

  before_action :authenticate_user!, :only => [:create, :show, :index, :edit, :update]

  def create
    @room = Room.create
     @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
     @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
    flash[:notice] = "チャットを作成しました！"
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
  end

  def index
    @rooms = Room.all
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(params.require(:room).permit(:name, :explain))
    flash[:notice] = "チャット情報が変更されました"
    redirect_to :back
  end

end