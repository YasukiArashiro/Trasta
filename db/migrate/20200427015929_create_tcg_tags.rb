class CreateTcgTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tcg_tags do |t|
      t.string :tcg_name
      t.boolean :tcg_status
      t.timestamps
    end
  end
end
