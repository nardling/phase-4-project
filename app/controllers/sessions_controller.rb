class SessionsController < ApplicationController

    # LOGIN
    def create
        user = User.find_by(name: params[:name])
            if user and user.authenticate(params[:password])
                session[:user_id] = user.id
                render json: user, status: :ok, except: (:password_digest)
            else
                render json: {errors: "Invalid Name or Password"}, status: 401
            end
        end

    # authenticates user to keep them logged in, NOT FINISHED - need to install JWT
    def authenticate_user
        auth_token = request.headers["auth-token"]
        token = JWT.decode(auth_token, "password")[0]
        user = User.find_by(id: token["user-id"])
        render json: user
    end
    
    # LOGOUT
        def delete 
            session.delete :user_id
            head :no_content
        end
end
