class RemoveOpponentUserIdFromRequest < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :opponent_user_id, :integer
  end
end
