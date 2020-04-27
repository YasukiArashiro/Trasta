class ChangeMatchStyleOfUsers < ActiveRecord::Migration[5.2]
  def up
  	change_column :users, :match_style_id, :integer, default: 1
  end
end
