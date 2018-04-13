class Api::V1::MessagesController < ApplicationController

  def create
    search = Search.find(messages_params[:search_id])
    @message = Message.new(messages_params)

    byebug

    if @message.save!
      StoreMailer.with(message: @message).customer_message.deliver_now

      render json: {message: "Sent message"}
    else
      render json: {errors: "Could not save message"}
    end


  end



  private

  def messages_params
    params.require(:messages).permit(:id, :customer_email, :store_id, :email_subject, :email_body, :search_id, :producer_id)
  end

end
