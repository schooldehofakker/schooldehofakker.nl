class HofnieuwsMailer < ApplicationMailer
  def send_hofnieuws_email(user)
    @user = user
    mail({
           to: user.email,
           from: 'mailing@schooldehofakker.nl',
           subject: 'Hofnieuws van School de Hofakker'
         })
  end
end
