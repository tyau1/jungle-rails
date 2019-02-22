class UserMailer < ApplicationMailer
    default from: "no-reply@jungle.com"

  def welcome_email(order)
    @order = order
    mail(to: @order.email, subject: 'Thank you for placing the order!')
  end
end
