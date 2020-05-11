class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all(params[:id])
    # @messages = Message.all
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
    if @message.update(message_params)
      redirect_to messages_path, notice: "メッセージを編集しました。"
    else
      flash.now[:alert] = "メッセージの編集に失敗しました。"
      render :edit
    end
    # message = Message.find(params[:id])
    # message.update(message_params)
    # redirect_to messages_path, notice: "メッセージを編集しました。"
  end
  

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to messages_path, alert: "メッセージを削除しました。"
    end
  end

  private 
  def message_params
    params.require(:message).permit(:title, :content)
  end

  def set_message
    @message = Message.find(params[:id])
  end