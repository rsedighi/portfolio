class MessageMailer < ActionMailer::Base
  default from: "ramin@sedighi.com"

  def send_message(message)
    @message = message

    mail to: "rsedighi@gmail.com", subject: "New Portfolio Message"
  end
end
