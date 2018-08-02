class CommentsController < ApplicationController
  before_action :authorized

  class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    if @post.comments.create!(comment_params).merge(user: current_user))
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end
