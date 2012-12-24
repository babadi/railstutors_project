class CommentsController < ApplicationController
	def create
		post = Post.find(params[:post_id])
		comment = Comment.new(params[:comment])
		if post.comments << comment 
			redirect_to post
		else
			redirect_to post, alert: "Error: " + comment.errors.full_messages.to_sentence
		end
	end
end
