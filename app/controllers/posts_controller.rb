class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.related.recent
  end

  def show
  	#error when not found
  	@post = Post.find_by_slug!(params[:slug])
  	@post.increase_views_count
  end

  def site_map
  	@posts = Post.related.recent
  	response.headers['content-type'] = 'application/xml'
  end

end
