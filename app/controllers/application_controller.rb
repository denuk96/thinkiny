class ApplicationController < ActionController::Base
  # before_action :set_time_zone

  private

  def admin_verify
    redirect_to root_path unless current_user&.admin?
  end

  # def set_time_zone
  #   Time.zone = current_user&.time_zone
  # end

end
