class CustomerMailer < ApplicationMailer
  default from: 'notifications@example.com'




  def stock_me_email(customer, store, producer)
    @producer = producer
    @customer = customer
    @store = store
    @url = 'http://localhost::3000/sendemail'

    mail(to: @store.email, from: @user.email,  subject: @user.subject, )
  end


end
