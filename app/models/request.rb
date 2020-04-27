class Request < ApplicationRecord
	belongs_to :user
	belongs_to :tcg_tag
	belongs_to :match_style

end
