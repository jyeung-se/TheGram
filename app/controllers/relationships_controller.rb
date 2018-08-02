class RelationshipsController < ApplicationController

  before_action :authorized

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    flash[:notice] = "You are now following."
    redirect_to @user
  end

  def destroy
    # Unfollows other user.
    # Destroys relationship between two users
    # @user should be the other user and not yourself
    
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)

    flash[:notice] = "Unfollow completed."
    redirect_to @user
  end

end
