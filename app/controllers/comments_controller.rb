class CommentsController < ApplicationController
  before_action :authorized

  def create
    @post = Post.find(params[:comment][:post_id])
    if @post.comments.create!(comment_params)
      redirect_to post_path(@post)
    else
      render :show
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end
