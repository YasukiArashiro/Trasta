class ChangeIntroductionToUsers2 < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :introduction, :text
  end
end
