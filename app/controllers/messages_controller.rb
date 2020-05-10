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
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: "メッセージを登録しました。"
    else
      flash.now[:alert] = "メッセージの登録に失敗しました。"
      render :new
    end
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
    message = Message.find(params[:id])
    message.destroy
    redirect_to messages_path, alert: "メッセージを削除しました。"
  end

  private 
  def message_params
    params.require(:message).permit(:title, :content)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
