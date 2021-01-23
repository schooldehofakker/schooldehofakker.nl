class HofnieuwsMailer < ApplicationMailer
  def send_hofnieuws_email(user)
    @user = user
    attachments['Hofnieuws-lang-1-2020.pdf'] = File.read('app/assets/pdf/Hofnieuws-lang-1-2020.pdf')
    mail({
           to: user.email,
           from: 'mailing@schooldehofakker.nl',
           subject: 'Hofnieuws van School de Hofakker'
         })
  end
end
