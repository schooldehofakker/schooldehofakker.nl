# Preview all emails at http://localhost:3000/rails/mailers/hofnieuws_mailer
class HofnieuwsMailerPreview < ActionMailer::Preview
  def send_hofnieuws_email
    HofnieuwsMailer.send_hofnieuws_email(User.new(
                                           first_name: 'Bob',
                                           last_name: 'Alice',
                                           uuid: 'bloeb',
                                           email: 'test@example.com'
                                         ))
  end
end
