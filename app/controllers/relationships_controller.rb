class RelationshipsController < ApplicationController

  before_action :authenticate_user!

  def create
      blogger = User.find(params[:user_id])
      @rel = Relationship.new(follower_id: current_user.id,
                              followed_id: blogger.id)
      @rel.save
      redirect_to user_path(blogger)
  end

  def destroy
      @rel = Relationship.find(params[:id])
      @rel.destroy
      redirect_to user_path(@rel.followed_id)
  end
end
