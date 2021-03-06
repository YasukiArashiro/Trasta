class Request < ApplicationRecord
	belongs_to :user
	belongs_to :tcg_tag
	belongs_to :match_style
	has_many :evaluations
	has_many :pairs

	validates :request_title, presence: true, length: { maximum: 25 }
	validates :tcg_tag_id, presence: true
	validates :match_day, presence: true
	validates :match_style_id, presence: true
	validates :meeting_time, presence: true
	validates :ending_time, presence: true
	validate :start_end_check
	validates :prefecture, presence: true
	validates :meeting_place, presence: true, length: { maximum: 55 }
	validates :request_comment, length: { maximum: 50 }

	def start_end_check
		unless meeting_time.nil? || ending_time.nil?
			errors.add(:ending_time, "の時間を正しく入力してください") unless
			self.meeting_time < self.ending_time
		end
	end

	enum prefecture: {
	    "都道府県":0,北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,茨城県:8,栃木県:9,群馬県:10,
	    埼玉県:11,千葉県:12,東京都:13,神奈川県:14,新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
	    岐阜県:21,静岡県:22,愛知県:23,三重県:24,滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
	    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,徳島県:36,香川県:37,愛媛県:38,高知県:39,福岡県:40,
	    佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
	  }

	enum request_status: {
		未成立:0,成立済み:1,対戦終了:2
	}

end
