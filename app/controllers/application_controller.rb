class ApplicationController < ActionController::API



  def issue_token(payload)
    JWT.encode(payload, ENV["jwt_secret"])
  end

  def decode_token(token)
    JWT.decode(token, ENV["jwt_secret"])[0]
  end

  def current_user(token)
    decode_hash = decode_token(token)
    User.find(decoded_hash["user_id"])
  end




end
