class SideCell < Cell::Rails
 
  def tags_cloud
  	@tags = Post.tag_counts_on(:tags)
  	render
  end
end
