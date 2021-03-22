# frozen_string_literal: true

# Default applications mailer

class ApplicationMailer < ActionMailer::Base
  default from: 'notificaties@schooldehofakker.nl'
  layout 'mailer'
end
