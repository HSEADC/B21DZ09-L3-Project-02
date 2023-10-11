class Post < ApplicationRecord
    validates :user_id, :presence => true
    validates :title, :presence => true
    validates :artist, :presence => true
	validates :description, :presence => true, :length => { :minimum => 10 }
    validates :body, :presence => true, :length => { :minimum => 30 }

    has_many :comments
    belongs_to :issue
end
