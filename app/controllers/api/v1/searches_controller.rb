class SearchesController < ApplicationController
  has_many :messages
  belongs_to :producer

  




  def create
    @producer = Producer.find(search_params[:producer_id])

    @message = @producer.searches.create!(search_term: search_params[:search_term], radius: search_params[:radius])

    render json: @message, status: 200
  end




  private

  def searches_params
    params.require(:searches).permit(:ip, :location_data, :search_term, :radius, :producer_id)
  end

end
