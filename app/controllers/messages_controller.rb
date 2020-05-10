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
    redirect_to :action => 'index'
    Message.create(message_params)
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    redirect_to :action => 'index'
    message = Message.find(params[:id])
    message.update(message_params)
  end

  def destroy
    redirect_to :action => 'index'
    message = Message.find(params[:id])
    message.destroy
  end

  private 
  def message_params
    params.require(:message).permit(:title, :content)
  end
end
