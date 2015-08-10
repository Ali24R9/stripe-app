class ApplicationMailer < ActionMailer::Base
  default from: "ali.a.zahr@gmail.com"
  layout 'mailer'

  # def customer_email(customer)
  #   @customer = customer
  #   mail(to: @customer.email, subject: "Welcome")
  # end
end
