class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :edit, :destroy]

  def index
    @users = User.all
  end

  def show
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create

  end

  def edit
    render :edit
  end

  def destroy

  end

  private

  def set_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
