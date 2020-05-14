class TcgGenre < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :tcg_tag, optional: true

	validates :tcg_tag_id, presence: true
end
