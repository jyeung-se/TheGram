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

    if @post.likes.length == 0
      Like.create(like_count: 0, post_id: params[:post], user_id: current_user.id)
      @post.likes << Like.last
    end

    like = @post.likes.first
    like.like_count += 1
    like.save

    redirect_to posts_path
  end

end
