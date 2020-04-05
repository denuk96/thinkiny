class CountUsersAttendanceWorker
  include Sidekiq::Worker

  def perform(course_id)
    course = Course.find course_id

    course.course_users.confirmed_participant.each do |course_user|
      lessons_count = course.lessons.size
      @user_attendance = 0
      course.lessons.each do |lesson|
        @user_attendance += 1 if lesson.check_ins.find_by(user_id: course_user.user_id, attendance: true).present?
      end
      user_attendance_rate = @user_attendance.to_f / lessons_count * 100
      course_user.update(completed: true) if course.attendance_rate <= user_attendance_rate
      UserMailer.course_completed(course_user.user, course, user_attendance_rate).deliver_now
    end
    puts 'Count users attendance completed'
  end
end
