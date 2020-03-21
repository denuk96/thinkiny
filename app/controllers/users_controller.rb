class UsersController < ApplicationController
  include CheckAuthorization
  before_action :current_user_already_exist?, except: %i[index show edit update activate viewed_notification]
  before_action :set_user, except: %i[new create]
  before_action :current_user_not_exist?, only: :show
  def index; end

  def show
    @notifications = Notification.where(user_id: @user.id, viewed: false)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to courses_path, notice: 'Welcome aboard!'
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

  def activate
    if (@user = User.load_from_activation_token(params[:activation_token]))
      @user.activate!
      redirect_to login_path, notice: 'User was successfully activated.'
    else
      redirect_to root_path, alert: 'Cannot activate this user.'
    end
  end

  def viewed_notification
    @notification = Notification.find(params[:notification_id])
    @notification.update!(viewed: true)
    redirect_to user_path(current_user)
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
