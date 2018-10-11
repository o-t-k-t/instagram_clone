module SessionsHelper
  def log_in(user_id)
    session[:user_id] = user_id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?(user_id)
    current_user && current_user.id == user_id
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete(:user_id)
  end

  # TODO: move to suite place
  def require_logged_in
    redirect_to new_session_path, notice: 'ログインしてください' unless logged_in?
  end
end
