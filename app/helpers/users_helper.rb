module UsersHelper
	def profile_link_for(user)
		link_to user.username, user_path(user)
	end
end
