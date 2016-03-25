class RelationshipsController < ApplicationController
  before_action :current_user

  def create
    user_to_follow = User.find(params[:followed_id])
    current_user.follow!(user_to_follow)
    flash[:notice] = "You have followed #{user_to_follow.username}"
    redirect_to tweets_path
  end

  def destroy
    user_to_unfollow = Relationship.find(params[:id]).followed
    current_user.unfollow!(user_to_unfollow)
    flash[:notice] = "You have unfollowed #{user_to_unfollow.username}"
    redirect_to tweets_path
  end
end
