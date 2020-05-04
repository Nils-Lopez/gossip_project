class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :gossip, optional: true
	belongs_to :comment, optional: true
	has_many :comments
	has_many :likes
end
