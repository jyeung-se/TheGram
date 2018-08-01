class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
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
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "WELCOME #{@user.username}, your account has been created!"
      session[:logged_in_user_id] = @user.id
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
      flash[:notice] = "Your updates have been saved!"
      redirect_to user_path
    else
      flash[:notice] = "Uh oh, please check to see your edits are allowed."
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Your account has been deleted. Thanks for using TheGram and we hope to see you back soon!"
    redirect_to login_path
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
    byebug
    @user = User.find(params[:id])
  end

end
