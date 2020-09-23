class Api::Auth::AuthenticationController < AccountController
    skip_before_action :authenticate_token!

    def create
        user = User.find_by(email: params[:email])
        if user.valid_password? params[:password]
            @current_user ||= user
            render json: {token: JsonWebToken.encode(sub: user.id)}
        else
            render json: {errors: ["Invalid user data"]}
        end
    end
end