class MailerWorkerWorker
  include Sidekiq::Worker

  def perform(user_id, type)
    case type
    when 'activation'
      UserMailer.activation_needed_email(user_id).deliver_now
    when 'success'
      UserMailer.activation_success_email(user_id).deliver_now
    when 'reset password'
      UserMailer.reset_password_email(user_id).deliver_now
    end
  end
end
