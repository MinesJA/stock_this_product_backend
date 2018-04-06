class Api::V1::StoreController < ApplicationController



  def index
    @stores = Store.all
    render json: @stores
  end

  def show
    @store = Store.find(params[:id])

    render json: @store, status: 200
  end

  def create
    @store = Store.new(store_params)
    @tool.save
  end





  private

  def store_params
    params.require(:store).permit(:name, :address_one, :address_two, :city, :state, :zipcode, :lat, :long, :buys, :phone, :email, :twitter_handle, :facebook_page, :producer_id)
  end


end
