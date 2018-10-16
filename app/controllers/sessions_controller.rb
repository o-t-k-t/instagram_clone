class SessionsController < ApplicationController
  before_action :require_logged_in, except: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user.id)
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'Eメールアドレスかパスワードが不正です'
      render :new
    end
  end

  def destroy
    log_out
    flash.now[:danger] = 'ログアウトしました'
    redirect_to new_session_path
  end

  private

  def session_params
    params.require(:session)
          .permit(:email, :password, :password_confirmation)
  end
end
