class Evaluation < ApplicationRecord
	belongs_to :user
	belongs_to :request

	enum evaluation: {
		良い:0,普通:1,悪い:2
	}
end
