class Pair < ApplicationRecord
	belongs_to :request
	belongs_to :contributor, class_name: 'User', foreign_key: 'contributor_id'
	belongs_to :opponent, class_name: 'User', foreign_key: 'opponent_id'
end
