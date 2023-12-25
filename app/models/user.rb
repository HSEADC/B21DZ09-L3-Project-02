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
end
