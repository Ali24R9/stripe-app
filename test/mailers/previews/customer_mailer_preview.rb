class CustomerMailerPreview < ActionMailer::Preview

  def welcome_email
    CustomerMailer.customer_email(Customer.first)
  end
end