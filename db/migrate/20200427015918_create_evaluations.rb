class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :user_id
      t.string :evaluation
      t.text :evaluation_comment
      t.boolean :evaluation_status
      t.timestamps
    end
  end
end
