module CoursesRights
  include ActiveSupport::Concern

  def verify_organizer
    organizer = @course.course_users.includes(:user).find_by(role: 'organizer', user_id: current_user&.id)&.user&.id
    unless (current_user&.id == organizer || current_user&.admin == true) && current_user.present?
      redirect_to root_path, alert: 'You have no rights'
    end
  end

  def verify_moderators
    organizer = @course.course_users.includes(:user).find_by(role: 'organizer', user_id: current_user&.id)&.user&.id
    instructor = @course.course_users.includes(:user).find_by(role: 'instructor', user_id: current_user&.id)&.user&.id
    unless (current_user&.id == organizer ||
            current_user&.id == instructor ||
            current_user&.admin == true) && current_user.present?
      redirect_to root_path(@course), alert: 'You have no rights'
    end
  end
end
