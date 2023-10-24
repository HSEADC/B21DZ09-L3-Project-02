class Issue < ApplicationRecord
  belongs_to :artist
  has_many :posts
end
