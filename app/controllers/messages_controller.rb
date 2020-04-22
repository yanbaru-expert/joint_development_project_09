class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  
  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    Message.create(message_params)
  end

  def edit
    @message = Message.find(params[:id])
  end


  private 
  def message_params
    params.require(:message).permit(:title, :content)
  end
end
