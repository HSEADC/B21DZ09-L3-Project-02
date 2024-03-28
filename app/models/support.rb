class Support < ApplicationRecord
    mount_uploader :post_image, PostImageUploader

    validate :post_image_size_validation

    # ... ...
    private
  
    def post_image_size_validation
      errors[:post_image] << "should be less than 5MB" if post_image.size > 20.megabytes
    end
end