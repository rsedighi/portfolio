class MessageMailer < ActionMailer::Base
  default from: "ramin@sedighi.com"

  def send_message(message)
    @message = message

    mail to: "ramin@sedighi.com", subject: "New Portfolio Message"
  end
end
