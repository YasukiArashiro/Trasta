class AddColumnRequests < ActiveRecord::Migration[5.2]
  def up
  	add_column :requests, :opponent_user_id, :intger
  end
end
