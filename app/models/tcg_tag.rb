class TcgTag < ApplicationRecord
	has_many :tcg_genres, dependent: :destroy
	has_many :users, through: :tcg_genres
	has_many :requests
end
