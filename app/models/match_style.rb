class MatchStyle < ApplicationRecord
	has_many :users
	has_many :requests
end
