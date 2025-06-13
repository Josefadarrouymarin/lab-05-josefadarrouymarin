class ChatsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @chats = Chat.involving(current_user)
  end

  def show
    # @chat ya está cargado por load_and_authorize_resource
  end

  def new
    # @chat ya está inicializado por load_and_authorize_resource
  end

  def create
    @chat.sender = current_user  # Forzamos que el sender sea el usuario logueado
    if @chat.save
      redirect_to @chat, notice: 'Chat was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @chat ya está cargado por load_and_authorize_resource
  end

  def update
    if @chat.update(chat_params)
      redirect_to @chat
    else
      render :edit
    end
  end

  def destroy
    @chat.destroy
    redirect_to chats_path, notice: 'Chat was successfully deleted.'
  end

  private

  def chat_params
    params.require(:chat).permit(:receiver_id)
  end
end

