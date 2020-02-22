class ApplicationController < ActionController::Base
  private

  def admin_verify
    redirect_to root_path unless current_user&.admin?
  end
end
