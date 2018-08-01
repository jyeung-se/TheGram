class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :followers, :following]

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
    # byebug
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @user.update(set_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy

  end

  def followers
    render :followers
  end

  def following
    render :following
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
