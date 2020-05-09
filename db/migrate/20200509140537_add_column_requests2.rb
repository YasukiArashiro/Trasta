class AddColumnRequests2 < ActiveRecord::Migration[5.2]
  def up
  	add_column :requests, :evaluation_status, :boolean, default: false
  end

  def down
  	remove_column :requests, :evaluation_status, :boolean, default: false
  end
end
