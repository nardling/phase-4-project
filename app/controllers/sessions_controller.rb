class SessionsController < ApplicationController

    def create
        user = User.find_by(name: params[:name])
            if user&.authenticate(params[:password])
                session[:user_id] = user.id
                render json: user, status: :ok, except: (:password_digest)
            else
                render json: {errors: "Invalid Name or Password"}
            end
        end
    
    
        def delete 
            session.delete :user_id
            head :no_content
        end
end
