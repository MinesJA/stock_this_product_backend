class Api::V1::MessagesController < ApplicationController

  def create
    byebug

    search = Search.find(messages_params[:search_id])



    @message = search.messages.new(search_params)

    if @message.save
      render json: {message: "Sent message"}
    else
      render json: {errors: "Could not save message"}
    end

  end

  private


  def messages_params


  end

end
