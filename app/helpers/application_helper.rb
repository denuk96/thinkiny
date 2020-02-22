module ApplicationHelper
  def current_users
    User.current_users
  end
end
