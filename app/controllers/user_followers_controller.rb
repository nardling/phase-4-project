class UserFollowersController < ApplicationController

    def addFollower
        uf = UserFollower.where(user_id: params[:userId], followerId: params[:followerId])
        if (uf.length > 0)
            render json: {}, status: 407
        else
            nuf = UserFollower.create(user_id: params[:userId], followerId: params[:followerId])
            if (nuf)
                render json: {}, status: 201
            else
                render json: {}, status: 406
            end
        end
    end
end
