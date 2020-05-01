class TcgTag < ApplicationRecord
	has_many :users
	has_many :requests
end
