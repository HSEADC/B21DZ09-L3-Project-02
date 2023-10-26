class Issue < ApplicationRecord
  belongs_to :artist
  has_many :posts, :dependent => :destroy

  mount_uploader :post_image, PostImageUploader
end
