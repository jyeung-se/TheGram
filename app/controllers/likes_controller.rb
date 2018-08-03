class LikesController < ApplicationController
  before_action :authorized

  def index
    @like = Like.all
  end

  def new
    @like = Like.new
    render :new
  end

  def create
    @post = Post.find(params[:post])

    if params[:like] == "like"
      Like.create(like_count: 0, post_id: params[:post], user_id: current_user.id)
      @post.likes << Like.last
    elsif params[:unlike] == "unlike"
      delete_me = current_user.likes.find_by(post_id: @post.id)
      delete_me.destroy
    end
    redirect_to posts_path
  end

end
