class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    send "define_#{controller_namespace.downcase}_ability", user
  end

  def define__ability(user)
    public_page_ability(user)
    admin_page_ability(user)
  end

  def define_admin_ability(user)
    admin_page_ability(user)
  end

  # 用户界面权限
  def public_page_ability(user)
    anonymous
    return unless user
  end

  # 管理界面权限
  def admin_page_ability(user)
    return unless user

    can [:edit, :update], User, :id => user.id
    send user.role.to_sym, user
  end

  # 未登录
  def anonymous
    can [:read, :preview], Post
  end

  def reader(user)
  end

  # 作者
  def writer(user)
    can [:read, :reviewings], Post
    can :manage, Post, :user_id => user.id
  end

  # 管理员
  def admin(_user)
    can :manage, :all
  end
end
