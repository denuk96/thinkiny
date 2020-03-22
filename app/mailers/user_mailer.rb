class UserMailer < ApplicationMailer
  def activation_needed_email(user)
    @user = user
    mail(to: user.email, subject: 'Account activation')
  end

  def activation_success_email(user)
    @user = user
    mail(to: user.email, subject: 'Your account is now activated')
  end

  def reset_password_email(user)
    @user = user
    @url  = edit_reset_password_url(@user.reset_password_token)
    mail(to: user.email, subject: 'Your password has been reset')
  end

  def course_status_changed(user, course)
    @user = user
    @course = course
    mail(to: user&.email, subject: 'Course status has been changed')
  end

end
