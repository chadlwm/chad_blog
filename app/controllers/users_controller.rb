class UsersController < ApplicationController
  def show
  	@user = User.find_by_name(params[:name])
  	@posts = @user.posts.order("created_at desc")
  end
end
