class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :admin_verify, only: [:edit, :update, :destroy]
  def show; end

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

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_panel_index_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_panel_index_path, notice: 'User was successfully destroy.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :crypted_password, :salt,
                                 :first_name, :last_name, :admin)
  end
end
