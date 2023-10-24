class Post < ApplicationRecord
  belongs_to :issue
  has_many :comments, :dependent => :destroy
end
