class PostsController < ApplicationController


  def index
    @posts = Post.all
    @users = User.all
    render :index
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

  private
  def set_params
    params.require(:post).permit(:caption, :picture, :user_id)
  end





end
