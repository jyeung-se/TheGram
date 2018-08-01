class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :logged_in?, :current_user

  def current_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    unless logged_in?
      flash[:notice] = "Please log in to see this content."
      redirect_to login_path
    end
  end
end
