class MessagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @messages = Message.all
  end

  def show; end

  def new; end

  def create
    if @message.save
      redirect_to @message
    else
      render :new
    end
  end

  def edit; end

  def update
    if @message.update(message_params)
      redirect_to @message
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:chat_id, :user_id, :body)
  end
end
