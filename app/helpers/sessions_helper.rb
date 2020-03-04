module SessionsHelper
  def current_user
    p session[:user_id]
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def current_user?(user)
    user == current_user
  end
end
