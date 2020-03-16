class SessionsController < ApplicationController
  include CheckAuthorization
  before_action :current_user_already_exist?, except: :destroy

  def new; end

  def create
    @user = login(params[:email], params[:password], params[:remember_me])
    if @user
      redirect_to courses_path, notice: 'Logged in!'
    else
      redirect_to root_url, notice: 'Email or password was invalid'
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'Logged out!'
  end
end
