class CreatePairs < ActiveRecord::Migration[5.2]
  def change
    create_table :pairs do |t|
      t.integer :request_id, foreign_key: true, null: false
      t.integer :contributor, foreign_key: { to_table: :users }, null: false
      t.integer :opponent, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
