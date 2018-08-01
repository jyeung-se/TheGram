class PostsController < ApplicationController
  before_action :authorized

  def index
    if logged_in?
      @posts = Post.all
      @users = User.all
      render :index
    else
      redirect_to sessions_path# or force a login
    end
  end

  def show

  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(set_params)

    if @post.save
      flash[:notice] = "Account created!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def like
    @post = Post.like
    # TODO Add like counter
  end


  private
  def set_params
    params.require(:post).permit(:caption, :picture, :user_id)
  end

end
