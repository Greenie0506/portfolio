class Notifier < ActionMailer::Base

  def support_notification(sender)
    @sender = sender
    mail(:to => "greenie0506@gmail.com",
         :from => sender.email,
         :subject => "New #{sender}")
 end
end
