class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_us.subject
  #
  def contact_us(message)
    @body = message.body
    @name = message.name
    @email = message.user_email
    mail to: "creation@nussucommit.com", from: "creation@nussucommit.com", :subject => "You Have a Message From Your Website"
  end
end
