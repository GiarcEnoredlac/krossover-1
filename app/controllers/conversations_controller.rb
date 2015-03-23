class ConversationsController < ApplicationController
	before_action :authenticate_user!

	def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
 
    render json: { conversation_id: @conversation.id }
  end
  
end
