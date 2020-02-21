class ApplicationController < ActionController::Base
  private

  def admin_verify
    redirect_to root_path unless current_user&.admin?
  end

  def not_authenticated
    redirect_to login_path, alert: 'Please login first' unless current_user
  end
end
