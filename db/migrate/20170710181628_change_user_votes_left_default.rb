# frozen_string_literal: true

class ChangeUserVotesLeftDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :votes_left, from: 10, to: 100
  end
end
