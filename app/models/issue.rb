class Issue < ApplicationRecord
  belongs_to :artist
  has_many :posts, :dependent => :destroy
  belongs_to :user

  mount_uploader :post_image, PostImageUploader
end
