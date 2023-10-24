class Artist < ApplicationRecord
    has_many :issues, :dependent => :destroy
end
