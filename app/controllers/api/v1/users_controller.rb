class Api::V1::UsersController < ApplicationController


  def create
    producer = Producer.find_or_create_by(name: user_params[:producer_name])

    @user = producer.users.new(username: user_params[:username], password: user_params[:password])

    if @user.save
      jwt = issue_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user), jwt: jwt}
    end
  end


  private

  def user_params
    params.require(:users).permit(:username, :password, :producer_name)
  end


end
