class CommentsController < ApplicationController
	before_filter :require_user

	def create
		post = Post.find(params[:post_id])
		comment = Comment.new(params[:comment])
		comment.user = current_user
		if post.comments << comment 
			redirect_to post
		else
			redirect_to post, alert: "Error: " + comment.errors.full_messages.to_sentence
		end
	end
end
