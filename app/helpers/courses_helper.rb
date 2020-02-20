module CoursesHelper
  def verify_instructor(course, user)
    organizer = course.course_users.includes(:user).find_by(role: 'organizer', user_id: user.id)&.user&.id
    instructor = course.course_users.find_by(role: 'instructor', user_id: user.id)&.user&.id
    true if  user.id == organizer ||
             user.id == instructor ||
             user.admin == true
  end

  def verify_organizer(course, user)
    organizer = course.course_users.includes(:user).find_by(role: 'organizer', user_id: user.id)&.user&.id
    true if user.id == organizer || user.admin == true
  end

  def already_joined?(course, user)
    true if course.course_users.find_by(user_id: user.id).present?
  end

  def free_places?(course)
    true if course.place_quantities > course.course_users.where(role: 'participant', confirmed: true).size
  end

  def count_free_places(course)
    course.place_quantities - course.course_users.where(role: 'participant', confirmed: true).size
  end
end
