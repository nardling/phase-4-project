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
end
