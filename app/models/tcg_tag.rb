class TcgTag < ApplicationRecord
	belongs_to :user
	belongs_to :request
end