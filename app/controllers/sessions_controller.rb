class SessionsController < ApplicationController
  include CheckAuthorization
  before_action :current_user_already_exist?, except: :destroy

  def new; end

  def create
    @user = login(params[:email], params[:password], params[:remember_me])
    if @user
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'Logged in!'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'Email or password was invalid'
    end
  end

  def destroy
    logout
    redirect_back(fallback_location: root_path)
    flash[:notice] = 'Logged out!'
  end
end
