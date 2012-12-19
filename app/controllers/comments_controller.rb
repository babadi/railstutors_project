class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(params[:comment])
		@comment.post = @post
		if @comment.save
			redirect_to @post, notice: "Comment posted successfully."
		else
			redirect_to @post, alert: "Error: " + @comment.errors.full_messages.to_sentence
		end
	end
end
