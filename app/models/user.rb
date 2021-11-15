class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :followers, foreign_key: 'followed_id', class_name: 'Relationship'
  has_many :following, foreign_key: 'follower_id', class_name: 'Relationship'

  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def username
    email.split('@')[0].capitalize
  end
end
