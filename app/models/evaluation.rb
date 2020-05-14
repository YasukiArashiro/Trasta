class Evaluation < ApplicationRecord
	belongs_to :user
	belongs_to :request

	validates :evaluation, presence: true
	validates :evaluation_comment, presence: true, length: { maximum: 35 }

	enum evaluation: {
		良い:0,普通:1,悪い:2
	}
end
