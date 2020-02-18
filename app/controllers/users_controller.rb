class UsersController < ApplicationController
  include CheckAuthorization
  before_action :current_user_already_exist?, except: %i[ show edit update ]
  before_action :set_user, except: %i[new create]
  before_action :not_authenticated, only: %i[show index edit update]

  def index; end

  def show;  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: 'Welcome!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User has been edited'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :crypted_password,
                                 :salt, :first_name, :last_name, :picture)
  end
end
