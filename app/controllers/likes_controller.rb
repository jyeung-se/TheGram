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
    @post = Post.find(params[:id])
    if @post.like.any?



    else
      @like = Like.create(like_count: 0, post_id: params[:post], user_id: current_user.id)

    redirect_to posts_path
      # current_user.likes.each do |like| # Get all of the likes from a person
      #   if like.post_id != @post.id #get this variable
      #     post = Post.find(like.post_id)
      #     like = post.likes.first
      #     like.like_count += 1
      #     like.save
      #   end
      #     @post.likes.first.like_count -= 1
      #     #find post_id somehow and update the like count
      #   end
      #
      # end
  end
end
