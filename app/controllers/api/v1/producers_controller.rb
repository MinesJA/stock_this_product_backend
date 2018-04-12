class Api::V1::ProducersController < ApplicationController


  def index
    @producers = Producer.all

    render json: @producers
  end


end
