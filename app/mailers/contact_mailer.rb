# frozen_string_literal: true

# Contact mailer
class ContactMailer < ApplicationMailer
  def contact_email(name, email, message)
    @url = 'https://schooldehofakker.nl/contact'
    @name = name
    @email = email
    @message = message
    mail(
      to: Rails.application.credentials.email[:contact],
      from: @email,
      subject: 'Contact via schooldehofakker.nl'
    )
  end
end
