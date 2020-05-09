class ChangeDataRaterRequests < ActiveRecord::Migration[5.2]
  def change
  	rename_column :requests, :rater_id, :rater
  end
end
