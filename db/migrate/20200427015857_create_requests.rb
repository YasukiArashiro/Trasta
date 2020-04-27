class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :tcg_tag_id
      t.integer :match_style_id
      t.integer :opponent_user_id
      t.string :request_title
      t.date :match_day
      t.time :meeting_time
      t.time :ending_time
      t.string :prefectures
      t.string :meeting_place
      t.text :request_comment
      t.string :request_status
      t.timestamps
    end
  end
end
