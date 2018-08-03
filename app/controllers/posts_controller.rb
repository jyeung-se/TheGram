class PostsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :show, :edit]

  def index
    if logged_in?
      @posts = Post.all
      @users = User.all
      @like = Like.new
      render :index
    else
      redirect_to sessions_path# or force a login
    end
  end



  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    render :show
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
      flash[:notice] = "Please include both a caption and a photo."
      render :new
    end
  end

  def destroy
    # byebug
    Post.find(params[:id]).destroy
    flash[:notice] = "Post deleted!"
    redirect_to user_path(current_user.id)
  end

  private
  def set_params
    params.require(:post).permit(:caption, :picture, :user_id)
  end

end
