class AddColumnEvaluations < ActiveRecord::Migration[5.2]
  def up
  	add_column :evaluations, :evaluation_partner, :integer
  	remove_column :evaluations, :evaluation_status, :boolean
  end

  def down
  	add_column :evaluations, :evaluation_status, :boolean
  	remove_column :evaluations, :evaluation_partner, :integer
  end
end
