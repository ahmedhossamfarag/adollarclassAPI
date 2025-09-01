module AuthHelper
  def authenticate_user
    token = request.authorization
    unless token and token.start_with?("Bearer ")
      render status: :unauthorized
      return
    end
    token = token[7..-1]
    secret = Rails.application.credentials[:jwt_secret]
    begin
      encoded_token = JWT::EncodedToken.new(token)
      encoded_token.verify!(signature: { key: secret, algorithm: "HS256" })
      payload = encoded_token.payload
      user_id = payload["data"]["user_id"]
      @user = User.find(user_id)
    rescue JWT::DecodeError
      render status: :unauthorized
    end
  end
end
