class UsersController < ApplicationController
  # before_action :require_logged_in, except: %i[new create]

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save
      log_in(@user.id)
      redirect_to user_path(current_user.id), notice: 'Created the account'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
