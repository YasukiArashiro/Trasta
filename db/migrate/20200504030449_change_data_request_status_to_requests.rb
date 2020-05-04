class ChangeDataRequestStatusToRequests < ActiveRecord::Migration[5.2]
  def change
  	change_column :requests, :request_status, :integer,　null: false, default: 0
  end
end
