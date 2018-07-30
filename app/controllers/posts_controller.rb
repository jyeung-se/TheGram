class PostsController < ApplicationController

  def show
    
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    #code
  end



end
