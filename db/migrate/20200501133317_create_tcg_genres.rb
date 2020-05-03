class CreateTcgGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :tcg_genres do |t|
      t.integer :user_id
      t.integer :tcg_tag_id

      t.timestamps
    end
  end
end
