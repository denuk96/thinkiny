module CoursesRights
  include ActiveSupport::Concern

  def verify_organizer
    if CourseUser.find_by(user_id: current_user.id, course_id: @course.id, role: 'organizer').nil?
      redirect_to root_path, alert: 'You have no rights'
    end
  end

  def verify_moderators
    organizer = CourseUser.find_by(user_id: current_user.id, course_id: @course.id, role: 'organizer').present?
    instructor = CourseUser.find_by(user_id: current_user.id, course_id: @course.id, role: 'instructor').present?
    redirect_to root_path, alert: 'You have no rights' unless organizer || instructor || current_user.admin
  end
end
