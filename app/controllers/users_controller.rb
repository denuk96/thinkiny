class UsersController < ApplicationController
  include CheckAuthorization
  before_action :current_user_already_exist?

  def index
    redirect_to signup_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :crypted_password, :salt,
                                 :first_name, :last_name)
  end
end
