module CheckAuthorization
  include ActiveSupport::Concern

  def current_user_already_exist?
    redirect_to root_path if current_user.present?
  end
end
