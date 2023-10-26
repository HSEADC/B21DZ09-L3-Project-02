class Post < ApplicationRecord
  belongs_to :issue
  has_many :comments, :dependent => :destroy
  belongs_to :user

  mount_uploader :post_image, PostImageUploader
end
