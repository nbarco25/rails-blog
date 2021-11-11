class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
