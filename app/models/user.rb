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
  has_many :contributor, class_name: 'Pair', foreign_key: 'contributor_id'
  has_many :opponent, class_name: 'Pair', foreign_key: 'opponent_id'
  attachment :profile_image

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 12 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :introduction, length: { maximum: 100 }
end
