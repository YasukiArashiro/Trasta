class AddColumnEvaluation < ActiveRecord::Migration[5.2]
  def up
  	add_column :evaluations, :request_id, :intger
  	change_column :evaluations, :evaluation, :intger
  end

  def down
  	remove_column :evaluations, :request_id, :intger
  	change_column :evaluations, :evaluation, :string
  end
end
