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

    if params[:like?] == "like"
      if @post.likes.length == 0
        Like.create(like_count: 0, post_id: params[:post], user_id: current_user.id)
        @post.likes << Like.last
      end
      like = @post.likes.first
      like.like_count += 1
      like.save
    elsif params[:like?] == "unlike"
      like = @post.likes.first
      if like.like_count > 0
        like.like_count -= 1
        like.save

        # Find my association with that post and delete it
        
        # delete_me = current_user.likes.find_by(post_id: @post.id)
        # delete_me.destroy
      end
    end
    redirect_to posts_path
  end

  def like
    #code
  end

end
