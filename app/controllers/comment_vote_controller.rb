# frozen_string_literal: true

class CommentVoteController < ApplicationController
  def create
    duplicate = CommentVote.where(user: current_user, comment_id: comment_vote_params[:comment_id])
    if duplicate.present?
      duplicate.destroy_all
      render json: 0, status: 200
    else
      vote = CommentVote.new(comment_vote_params)
      vote.user = current_user
      vote.save!
      user_vote = Comment.find(params[:comment_id]).user_vote(current_user)
      render json: user_vote, status: 200
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_vote_params
    params.permit(:comment_id, :vote)
    # params.fetch(:comment, {})
  end
end
