# frozen_string_literal: true

class CreateCommentVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_votes do |t|
      t.belongs_to :user
      t.belongs_to :comment
      t.integer :vote

      t.timestamps
    end
  end
end
