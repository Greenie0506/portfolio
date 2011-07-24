ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'smtp.gmail.com',
  :port => 587,
  :domain => "localhost:3000",
  :user_name => 'greenie0506@gmail.com',
  :password => 'goober55555',
  :authentication => 'plain',
}
