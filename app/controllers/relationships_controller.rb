class RelationshipsController < ApplicationController

  before_action :authenticate_user!

  def create
    blogger = User.find(params[:user_id])
    @rel = Relationship.new(
      follower_id: current_user.id,
      followed_id: blogger.id)
    if @rel.save
      redirect_to user_path(blogger)
    else
      redirect_to root_path
    end
  end

  def destroy
    @rel = Relationship.find(params[:id])
    if @rel.destroy
      redirect_to user_path(@rel.followed_id)
    else
      redirect_to root_path
    end
  end
end
