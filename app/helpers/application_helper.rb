module ApplicationHelper
  def current_users
    User.current_users
  end

  def set_page_title(title)
    content_for :page_title, title
  end

  def set_language_dropdown
    if I18n.locale == :en
      flag_icon(:eu)
    else
      flag_icon(:ru)
    end
  end

  def notification(user)
    user.notifications.find_by(viewed: false) != nil
  end
end
