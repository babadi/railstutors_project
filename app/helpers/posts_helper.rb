module PostsHelper
	def comment_count_for(post)
		comment_count = post.comments.count
		(comment_count > 0 ? comment_count.to_s : "No") + " comment".pluralize(comment_count)
	end

	def url_link_for(post)
		link_to post.title, post.url
	end
end
