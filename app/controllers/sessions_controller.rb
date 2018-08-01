class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
    # don't need anything in here, cause we're not setting up a
    # blank model to couple with the form
  end

  def create
    # no strong params cause there is no mass assignment
    @user = User.find_by(username: params[:username])
    # if @user && @user.authenticate(params[:password])
    #   session[:user_id] = @user.id
    #   redirect_to @user
    # else
    #   redirect_to login_path
    # end
    if !!@user && @user.authenticate(params[:password])
      # the user is who they say they are
      session[:logged_in_user_id] = @user.id
      flash[:notice] = "Login Successful"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Invalid username or password. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    # session.delete(:user_id) # or session[:user_id] = nil
    session.delete(:logged_in_user_id)
    flash[:notice] = "You have logged out successfully."
    redirect_to login_path
  end
end
