class MessagesController < ApplicationController

  def index
    @message = Message.new
    @message_all = Message.all
    respond_to do |format|
			format.html
      format.json{ @new_message = Message.where('id > ?', params[:id]) }
    end
  end

  def create
    @message = Message.new(message_params)
    @message.save
      respond_to do |format|
        format.html { redirect_to messages_path  }
        format.json
      end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image, :video).merge(user_id: current_user.id)
  end

end
