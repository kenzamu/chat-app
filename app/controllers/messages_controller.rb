class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(room_params)
    if   @message.save
      redirect_to room_message_path(@room)
    else
      render :index
    end
  end

  private

  def room_params
    params.require(:message).permit(:contant).marge(user_id: current_user.id)
  end

end
