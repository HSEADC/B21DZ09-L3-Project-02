class Artist < ApplicationRecord
    has_many :issues, :dependent => :destroy
    belongs_to :user

    mount_uploader :post_image, PostImageUploader

    self.per_page = 5
end

WillPaginate.per_page = 5