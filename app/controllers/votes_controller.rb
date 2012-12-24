class VotesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@vote = Vote.new(:post_id => @post.id, :vote_type => params[:type_value])
		if @vote.save
			redirect_to :back
		else
			redirect_to :back, alert: "Your vote could not be saved: " + @post.errors.full_messages.to_sentence
		end
	end		
end
