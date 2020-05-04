class RenamePrefecturesColumnToRequests < ActiveRecord::Migration[5.2]
  def change
  	rename_column :requests, :prefectures, :prefecture
  	change_column :requests, :prefecture, :integer,　null: false, default: 0
  end
end
