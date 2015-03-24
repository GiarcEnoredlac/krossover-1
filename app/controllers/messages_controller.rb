class MessagesController < ApplicationController
  
  def create
    respond_to do |format|
      @conversation = Conversation.find(params[:conversation_id])
      @message = @conversation.messages.create(message_params)
      @message.user_id = current_user.id
      if @message.save
        flash.now[:success] = 'Your comment was successfully posted!'
      else
        flash.now[:error] = 'Your comment cannot be saved.'
      end
      format.html {redirect_to root_url}
      format.js
    end
  end
 
  private
 
  def message_params
    params.require(:message).permit(:body, :conversation_id, :user_id)
  end
end
