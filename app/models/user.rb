class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :parties, through: :favorites
  has_many :attend_parties, dependent: :destroy
  has_many :parties, through: :attend_parties
  has_many :clips, dependent: :destroy
  has_many :parties, through: :clips
  attachment :image
end
