# frozen_string_literal: true

# Handle Hofnieuws mailer via sidekiq to enable async sending
class HofnieuwsWorker
  include Sidekiq::Worker

  def perform(user_email, mailing)
    @user = User.find_by(email: user_email)
    @mailing = Mailing.find_by(id: mailing)
    HofnieuwsMailer.send_hofnieuws_email(@user, @mailing).deliver_later
  end
end
