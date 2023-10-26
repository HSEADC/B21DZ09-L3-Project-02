class Artist < ApplicationRecord
    has_many :issues, :dependent => :destroy

    mount_uploader :post_image, PostImageUploader
end
