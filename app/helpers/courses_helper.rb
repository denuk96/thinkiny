module CoursesHelper
  def verify_instructor(course, user)
    true if course.course_users.find_by(user_id: user.id, role: 'organizer').present? ||
            course.course_users.find_by(user_id: user.id, role: 'instructor').present? ||
            user.admin
  end

  def verify_organizer(course, user)
    true if course.course_users.find_by(user_id: user.id, role: 'organizer').present? ||
            user.admin
  end

  def already_joined?(course, user)
    true if course.course_users.find_by(user_id: user.id).present?
  end

  def completed_course?(course, user)
    true if course.course_users.find_by(user_id: user.id, completed: true, role: 'participant').present?
  end

  def free_places?(course)
    true if course.place_quantities > course.course_users.confirmed_participant.size
  end

  def count_free_places(course)
    course.place_quantities - course.course_users.confirmed_participant.size
  end
end
