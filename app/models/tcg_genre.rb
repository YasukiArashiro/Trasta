class TcgGenre < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :tcg_tag, optional: true
end
