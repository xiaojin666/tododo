class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # 定义两个 helper 方法，可以在 view 中引用
  helper_method :current_user, :logined?

  def login_as(user)
    session[:user_id] = user.id
    @current_user = user
  end

  # 如果 current_user 方法返回 nil，则说明没有登录
  def logined?
    current_user != nil
  end

  def current_user
    @current_user
  end
end
