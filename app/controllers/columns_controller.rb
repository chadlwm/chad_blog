class ColumnsController < ApplicationController
  def show
  	column = Column.find_by_slug(params[:slug])
  	@posts = column.posts.includes(:author).order("created_at desc")
  	@tags = Post.tag_counts_on(:tags)
  end
end
