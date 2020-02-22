module CoursesRights
  include ActiveSupport::Concern

  def verify_organizer
    if CourseUser.organizers.find_by(user_id: current_user.id, course_id: @course.id).nil?
      redirect_to root_path, alert: 'You have no rights'
    end
  end

  def verify_moderators
    organizer = CourseUser.organizers.find_by(user_id: current_user.id, course_id: @course.id).present?
    instructor = CourseUser.instructors.find_by(user_id: current_user.id, course_id: @course.id).present?
    redirect_to root_path, alert: 'You have no rights' unless organizer || instructor || current_user.admin
  end

  def check_course_status
    redirect_to course_path(@course), alert: 'Course is completed' if @course.status == 'completed'
  end
end
