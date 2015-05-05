class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.includes(:author, :column).order("created_at desc")
  	@tags = Post.tag_counts_on(:tags)
  end

  def show
  	@post = Post.find_by_slug(params[:slug])
  	@tags = Post.tag_counts_on(:tags)
  end

end
