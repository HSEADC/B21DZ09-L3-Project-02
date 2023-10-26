class AddPostImageToIssue < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :post_image, :string
  end
end
