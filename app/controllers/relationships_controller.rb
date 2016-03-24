class RelationshipsController < ApplicationController
  before_action :current_user

  def create
    user = User.find(params[:followed_id])
    current_user.follow!(user)
    flash[:notice] = "You have followed #{user.username}"
    redirect_to tweets_path
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow!(user)
    flash[:notice] = "You have unfollowed #{user.username}"
    redirect_to tweets_path
  end
end
