class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    # @users is loaded automatically
  end

  def show
    # @user is loaded automatically
  end

  def new
    # @user is initialized automatically
  end

  def create
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @user is loaded automatically
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end

  private

  def user_params
    # Solo permitimos parámetros básicos para edición. Para creación vía admin, podrías agregar password y confirmation si hiciera falta.
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
