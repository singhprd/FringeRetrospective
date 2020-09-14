# frozen_string_literal: true

class AddVoteLimitToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :votes_left, :integer, default: 10
    add_column :users, :vote_reset_amount, :integer, default: 10
  end
end
