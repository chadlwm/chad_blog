class TagsController < ApplicationController
  def show
  	@tag = params[:tag]
  	@posts = Post.tagged_with(@tag).includes(:author).order('created_at desc')
  end
end
