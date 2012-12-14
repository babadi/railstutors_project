module PostsHelper
	def comment_count_for(post)
		count = post.comments.count
		(count > 0 ? count.to_s : "No") + " comment".pluralize(count)
	end
end
