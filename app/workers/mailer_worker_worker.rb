class MailerWorkerWorker
  include Sidekiq::Worker

  def perform(id, type)
    case type
    when 'activation'
      UserMailer.activation_needed_email(id).deliver_now
    when 'success'
      UserMailer.activation_success_email(id).deliver_now
    when 'reset password'
      UserMailer.reset_password_email(id).deliver_now
    when 'course started'
      course = Course.find id
      course.course_users.each do |course_user|
        UserMailer.course_started(course_user.user, course).deliver_now
      end
    when 'user confirmed'
      course_user = CourseUser.find id
      UserMailer.user_confirmed_course(course_user.user, course_user.course).deliver_now
    when 'user unconfirmed'
      course_user = CourseUser.find id
      UserMailer.user_unconfirmed_course(course_user.user, course_user.course).deliver_now
    end
  end
end
