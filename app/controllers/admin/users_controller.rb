class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def edit
  end

  def update
    @user.update(user_params)
    flash[:notice] = "更新用户信息成功"
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :introduce)
  end
end
