class Vote < ActiveRecord::Base
	DOWNVOTE_VALUE = 0
	UPVOTE_VALUE = 1
	attr_accessible :post_id, :vote_type
	belongs_to :post
	belongs_to :user
end
