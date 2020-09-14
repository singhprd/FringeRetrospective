class FriendRequestsController < ApplicationController
  def create
    email = params[:email]
    recipient = User.find_by_email(email)

    if recipient && current_user.friends_with?(recipient)
      flash[:notice] = "You're already friends!"
      return false
    end

    if recipient
      FriendRequest.create(
        sender: current_user,
        recipient: recipient
      )
    else
      # flash[:notice] = "No users with that email address"
      # FriendRequest.create_for_newly_invited_user(current_user, email)
      recipient = User.invite!(email: email)

      FriendRequest.create(
        sender: current_user,
        recipient: recipient
      )
    end
  end

  def update
    if params[:friend_request_action] == "ACCEPT"
      # raise unless request.recipient == current_user
      request = FriendRequest.find(params[:id])
      request.accept!
    end
  end

  def destroy
    FriendRequest.find(params[:id]).destroy
  end
end
