ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "mydomain.net",
    :user_name => "gmailuser@gmail.com",
    :password => "gmailPassword",
    :authentication => "plain",
    :enable_starttls_auto => true
}