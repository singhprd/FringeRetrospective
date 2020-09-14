class FriendRequest < ApplicationRecord
  # belongs_to :user, :through => :inviting_user
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :sender_id, uniqueness: { scope: :recipient_id }

  def accept!
    Friendship.create_reciprocal_for_ids(sender.id, recipient.id)
    destroy!
  end

  def self.create_for_newly_invited_user(sender, new_user_email)
    invited_user = User.new(email: new_user_email)
    invited_user.skip_password_validation = true
    invited_user.save

    invited_user.send_invite_email!

    FriendRequest.create(
      sender: sender,
      recipient: invited_user.reload
    )
  end
end
