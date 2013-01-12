class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.new(params[:user])
		if user.save
			redirect_to root_path, notice: "Account created successfully."
		else
			flash[:alert] = "Account creation failed: " + user.errors.full_messages.to_sentence
			render 'new'
		end
	end
end
