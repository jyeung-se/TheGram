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
    end

    like = @post.likes.first
    like.like_count += 1
    like.save


    # if @post.likes.any?
    #   if current_user.likes.any?
    #     current_user.likes.each do |like|
    #
    #       if like.post_id == @post.id # if true, decrament like_count
    #         if @post.likes.first.like_count > 0
    #           @post.likes.first.like_count -= 1
    #           @post.save
    #         end
    #       else
    #         @post.likes.first.like_count += 1
    #         @post.save
    #       end
    #     end
    #   end
    # else
    #   @like = Like.create(like_count: 0, post_id: params[:post], user_id: current_user.id)
    # end
    redirect_to posts_path
  end

end
