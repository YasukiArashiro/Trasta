class ChangeIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :introduction, :text, default: "よろしくお願いします！"
  end
end
