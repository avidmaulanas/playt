class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  # GET /user/show
  def show
  end

  # GET /user/edit
  def edit
  end

  # GET /user/password
  def password
  end

  # PATCH /user/update
  def update
    if @user.update(user_params)
      redirect_to user_url, notice: "Your account was updated"
    else
      render :edit
    end
  end

  # PATCH /user/update_password
  def update_password
    if @user.update_with_password(password_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, bypass: true
      redirect_to password_user_url, notice: "Your password was changed"
    else
      render :password
    end
  end

  private
    def password_params
      params.require(:user).permit(:current_password, :password, :password_confirmation)
    end

    def user_params
      params.require(:user).permit(:email, :username)
    end

    def set_user
      @user = current_user
    end
end
