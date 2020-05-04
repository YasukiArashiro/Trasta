class ChangeDataRequestStatusTorequests < ActiveRecord::Migration[5.2]
  def change
  	change_column :requests, :request_status, :integer
  end
end
