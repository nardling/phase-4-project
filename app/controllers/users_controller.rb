class UsersController < ApplicationController
    # gets all users
    def index
    users = User.all
    render json: users, status: :ok
    end

    # gets individual user, error if not found
    def show
        # byebug
    user = User.find(params[:id])
    render json: user, status: :ok, include: [:posts]
    end

    def createAccount
        user = User.find_by(name: params[:name])
        if (user)
            render json: {errors: "Name already exists"}, status: 401
        else
            u = User.create(name: params[:name], handle: params[:handle], password: params[:password])
            if (u)
                render json: {}, status: :ok
            else
                render json: { errors: "User Creation Failed" }, status: 401
            end
        end
    end

    # def create
    # user = User.create!(user_params)
    # render json: user, status: :created, except: :password_digest
    # end

    private

    def user_params 
        params.permit(:name, :handle, :password_digest)
    end
end
