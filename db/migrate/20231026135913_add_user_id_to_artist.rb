class AddUserIdToArtist < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :user_id, :integer
  end
end
