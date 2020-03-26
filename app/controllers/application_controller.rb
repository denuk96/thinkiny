class ApplicationController < ActionController::Base
  before_action :set_time_zone, if: current_user

  private

  def admin_verify
    redirect_to root_path unless current_user&.admin?
  end

end
