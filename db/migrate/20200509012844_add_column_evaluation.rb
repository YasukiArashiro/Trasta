class AddColumnEvaluation < ActiveRecord::Migration[5.2]
  def up
  	add_column :evaluations, :request_id, :integer
  	change_column :evaluations, :evaluation, :integer
  end

  def down
  	remove_column :evaluations, :request_id, :integer
  	change_column :evaluations, :evaluation, :string
  end
end
