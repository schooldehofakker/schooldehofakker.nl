# Handle Hofnieuws mailer via sidekiq to enable async sending
class HofnieuwsWorker
  include Sidekiq::Worker

  def perform(user_email)
    @user = User.find_by(email: user_email)
    HofnieuwsMailer.send_hofnieuws_email(@user).deliver_later
  end
end
