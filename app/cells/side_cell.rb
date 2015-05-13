class SideCell < Cell::Rails
 
  def tags_cloud
  	@tags = Post.tag_counts_on(:tags)
  	render
  end

  def hot_posts
  	@posts = Post.order(views_count: :desc).limit(6)
  	render
  end
end
