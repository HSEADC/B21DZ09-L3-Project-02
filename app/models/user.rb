class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :artists
  has_many :issues
  has_many :posts
  has_many :comments

  has_many :favourites
  has_many :posts_i_favourited, through: :favourites, source: 'post'

  has_many :likes
  has_many :posts_i_liked, through: :likes, source: 'post'
end
