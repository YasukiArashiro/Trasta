class CreateMatchStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :match_styles do |t|
      t.string :match_style
      t.boolean :match_style_status
      t.timestamps
    end
  end
end
