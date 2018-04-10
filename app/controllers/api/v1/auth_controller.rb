class Api::V1::AuthController < ApplicationController


  def create
    @user = User.find_by(username: auth_params[:username])

    if @user && @user.authenticate(auth_params[:password])
      byebug
      jwt = issue_token({user_id: @user.id})
      render json: {user: @user, jwt: jwt}
    else
      render json: {error: "User not found or password did not match"}
    end

  end


  def show
    if logged_user
      render json: logged_user
    else
      render json: {error: "Incorrect credentials"}
    end
  end



  private

  def auth_params
    params.require(:auth).permit(:username, :password)
  end

end
