class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def destroy
    Friendship.destroy_reciprocal_for_ids(current_user.id, params[:friendId])
  end
end
