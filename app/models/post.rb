class Post < ApplicationRecord
  belongs_to :issue
  has_many :comments, :dependent => :destroy
  belongs_to :user

  has_many :favourites
  has_many :users_who_favourited, through: :favourites, source: 'user'

  has_many :likes
  has_many :users_who_liked, through: :likes, source: 'user'

  mount_uploader :post_image, PostImageUploader

  acts_as_taggable_on :tags

  self.per_page = 10

end