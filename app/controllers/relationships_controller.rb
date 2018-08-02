class RelationshipsController < ApplicationController

  before_action :authorized

  def create
    person_to_follow = User.find(params[:relationship][:followed_id])
    current_user.following << person_to_follow
    flash[:notice] = "You are now following."
    redirect_to user_path(current_user)
  end

  def destroy
    # Unfollows other user.
    # Destroys relationship between two users
    # @user should be the other user and not yourself

    person_to_unfollow = Relationship.find(params[:id]).followed
    current_user.unfollow!(person_to_unfollow)

    flash[:notice] = "Unfollow completed."
    redirect_to @user
  end

end
