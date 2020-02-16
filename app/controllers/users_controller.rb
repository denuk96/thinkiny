class UsersController < ApplicationController
  include CheckAuthorization
  before_action :current_user_already_exist?, except: :show
  before_action :set_user, only: %i[show edit update destroy]
  before_action :admin_verify, only: %i[edit update destroy]
  before_action :not_authenticated, only: :show

  def index
    redirect_to signup_path
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: 'Welcome aboard!'
    else
      render :new
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :crypted_password, :salt,
                                 :first_name, :last_name)
  end
end
