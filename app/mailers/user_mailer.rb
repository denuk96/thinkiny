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
end
