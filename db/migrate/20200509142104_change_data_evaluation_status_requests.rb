class ChangeDataEvaluationStatusRequests < ActiveRecord::Migration[5.2]
  def change
  	rename_column :requests, :evaluation_status, :rater_id
  	change_column :requests, :rater_id, :integer
  end
end
