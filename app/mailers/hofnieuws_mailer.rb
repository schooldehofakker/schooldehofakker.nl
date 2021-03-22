# frozen_string_literal: true

class HofnieuwsMailer < ApplicationMailer
  def send_hofnieuws_email(user, mailing)
    @user = user
    @mailing = mailing
    mail({
           to: user.email,
           from: 'mailing@schooldehofakker.nl',
           subject: mailing.title
         })
  end
end
