# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :comment_votes, dependent: :destroy

  validates :event, presence: true
  validates :user, presence: true
  validates :text, presence: true

  def votes
    CommentVote.where(comment_id: id).map(&:vote).sum
  end

  def user_vote(current_user)
    comment_votes.where(user_id: current_user).last&.vote || 0
  end

  def as_json(_options = {})
    super(methods: [:votes], include: { user: { only: :username } })
  end

  def comment_json_with_user_vote(current_user)
    as_json.merge("user_vote": user_vote(current_user))
  end
end
