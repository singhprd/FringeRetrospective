class AddCurrentChallengeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column(:users, :current_challenge, :string)
  end
end
