class ConversationsController < ApplicationController
  before_action :correct_users, except: [:create]

	def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to @conversation
  end
 
  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = Message.where(conversation_id: @conversation.id)
    @message = Message.new
  end
 
  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def correct_users
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    unless @conversation.sender_id == current_user.id || @receiver == current_user
      redirect_to root_path
    end
  end 
 
  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end



end
