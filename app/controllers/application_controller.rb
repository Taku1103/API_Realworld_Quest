class ApplicationController < ActionController::API

  def create_token(user_id)
    payload = { user_id: user_id}
    secret_key = Rails.application.secrets.secret_key_base
    token = JWT.encode(payload, secret_key)
    return token
  end

  private
  def decode_jwt(token)
    secret_key = Rails.application.secrets.secret_key_base
    JWT.decode(token, secret_key).first
  rescue JWT::DecodeError
    nil
  end

  def user_exists?(user_id)
    User.exists?(user_id)
  end

  def authenticate_user
    authorization_header = request.headers[:authorization]

    if authorization_header
      req_token = authorization_header.split(" ")[1]
      decoded_token = decode_jwt(req_token)

      if decoded_token && user_exists?(decoded_token["user_id"])
        # ユーザーが存在する場合は続行
        @current_user = User.find(decoded_token["user_id"])
      else
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
