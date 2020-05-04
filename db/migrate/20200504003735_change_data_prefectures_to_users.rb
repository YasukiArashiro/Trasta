class ChangeDataPrefecturesToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :requests, :prefectures, :integer
  end
end
