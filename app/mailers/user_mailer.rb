class UserMailer < ApplicationMailer
  def activation_needed_email_background(user)
    MailerWorkerWorker.perform_async(user.id, 'activation')
  end

  def activation_needed_email(user_id)
    user = User.find_by(id: user_id)
    @user = user
    mail(to: user.email, subject: 'Account activation')
  end

  def activation_success_email_background(user)
    MailerWorkerWorker.perform_async(user.id, 'success')
  end

  def activation_success_email(user_id)
    user = User.find_by(id: user_id)
    @user = user
    mail(to: user.email, subject: 'Your account is now activated')
  end

  def reset_password_email_background(user)
    MailerWorkerWorker.perform_async(user.id, 'reset password')
  end

  def reset_password_email(user_id)
    user = User.find_by(id: user_id)
    @user = user
    @url  = edit_reset_password_url(@user.reset_password_token)
    mail(to: user.email, subject: 'Your password has been reset')
  end

  def course_started(user, course)
    @course = course
    @user = user
    mail(to: user.email, subject: "Course #{course.name.capitalize} has been started")
  end

  def course_completed(user, course, user_attendance_rate)
    @course = course
    @user_attendance_rate = user_attendance_rate
    @user = user
    mail(to: user.email, subject: "Course #{course.name.capitalize} has been completed")
  end

  def user_confirmed_course(user, course)
    @course = course
    @user = user
    mail(to: user.email, subject: "You has been confirmed for #{course.name.capitalize}")
  end

  def user_unconfirmed_course(user, course)
    @course = course
    @user = user
    mail(to: user.email, subject: "You has been unconfirmed for #{course.name.capitalize}")
  end
end
