class Account_controller < ApplicationController

    before_action :set_default_format
    before_action :authenticate_token!

    private
    def set_default_format
        request.format = :json
    end

    def authenticate_token!
        payload=JsonWebToken.decode(auth_token)
        @current_user=User.find(payload["sub"])
    rescue JWT::ExpiredSignature
        render json: {errors: ["Token expired"]}, status: :unauthorized
    rescue JWT::DecodeError
        render json: {errors: ["Invalid authent token"]}, status: :unauthorized
    end
    
    def auth_token
        @auth_token ||= request.headers.fetch("Authorization", " ").split(" ").last
    end
end