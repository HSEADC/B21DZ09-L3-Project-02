class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :description
      t.string :body
      t.references :issue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
