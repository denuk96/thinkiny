class MailerWorkerWorker
  include Sidekiq::Worker

  def perform(user)
    @user = user
    mail(to: user.email, subject: 'Account activation')
  end
end
