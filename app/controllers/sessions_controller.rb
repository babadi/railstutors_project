class SessionsController < ApplicationController
	def new
	end

	def create
		u = User.where(username: params[:username]).first
		if u && u.authenticate(params[:password])
			session[:user_id] = u.id
			redirect_to root_path
		else
			flash[:alert] = "Login failed. Check your credentials and try again."
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: "Logged out successfully."
	end
end