class AddPostImageToArtist < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :post_image, :string
  end
end
