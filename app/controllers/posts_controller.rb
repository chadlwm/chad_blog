class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
  end

  def show
  	@tags = Post.tag_counts_on(:tags)
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
end
