class AuthController < ApplicationController
  def signin
    params.expect(:email, :password)
    user = User.find_by(email: params.expect(:email))
    if user == nil
      render status: :not_found
    else
      if not user.authenticate(params.expect(:password))
        render status: :unauthorized
      else
        exp = Time.now.to_i + 4 * 3600
        exp_payload = { data: { user_id: user.id }, exp: exp }
        secret = Rails.application.credentials[:jwt_secret]
        token = JWT.encode(exp_payload, secret, "HS256")
        render json: { token: token }
      end
    end
  end
end
