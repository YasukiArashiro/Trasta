class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requests, dependent: :destroy
  has_many :evaluations
  has_many :tcg_genres, dependent: :destroy
  has_many :tcg_tags, through: :tcg_genres
  belongs_to :match_style, optional: true

  attachment :profile_image
end
