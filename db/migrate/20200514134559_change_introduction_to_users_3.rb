class ChangeIntroductionToUsers3 < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :introduction, :text, default: nil
  end
end
