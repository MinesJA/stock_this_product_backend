class AuthController < ApplicationController


  def create
    @user = User.find_by(username: auth_params[:username])

    if @user && @user.authenticate(auth_params[:password])
      jwt = issue_token({user_id: @user.id})
      render json: {user: @user, jwt: jwt}
    else
      render json: {error: "User not found or password did not match"}
    end

  end


  def show
    

  end



  private

  def auth_params
    params.require(:auth).permit(:username, :password)
  end

end
