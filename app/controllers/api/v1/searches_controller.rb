class Api::V1::SearchesController < ApplicationController




  def create
    producer_id = searches_params[:producer_id]
    search_term = searches_params[:search_terms]
    radius = searches_params[:radius]
    ip = request.remote_ip

    producer = Producer.find(producer_id)
    @search = producer.searches.new(searches_params)

    if @search.save
      render json: {message: "Logged search #{ip}", id: @search.id},  status: 200
    else
      render json: {error: "Search was unable to save."}
    end

  end



  private

  def searches_params
    params.require(:searches).permit(:ip, :location_data, :search_term, :radius, :producer_id, :latitude, :longitude)
  end

end
