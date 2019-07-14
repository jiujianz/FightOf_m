class MessagesController < ApplicationController

  def index
    @message = Message.new
    @message_all = Message.all
  end

  def create
    @message = Message.create(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:content, :image, :video).merge(user_id: current_user.id)
  end

end
