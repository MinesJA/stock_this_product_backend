class StoreMailer < ApplicationMailer


  def customer_message
    @message = params[:message]


    mail(to: @message.store_email, from: @message.customer_email, subject: @message.email_subject)
  end



end
