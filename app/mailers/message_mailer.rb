class MessageMailer < ActionMailer::Base

  # default from: ""
  default to: "prakashthonnur@gmail.com"

  def new_message(message, from)
    @from = from
    @to = "inspireacademymysore@gmail.com"
    @message = message
    @phone_number = @message.phone_number
    @body = @message.content
    @name = @message.name
    mail(:from => @from, :to => @to, :subject => 'Contact information')
  end

end
