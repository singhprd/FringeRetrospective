# frozen_string_literal: true

class CreateCommentVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_votes do |t|
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.integer :vote

      t.timestamps
    end
  end
end
