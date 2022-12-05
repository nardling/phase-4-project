class PostsController < ApplicationController

    def getLatest
        uf = UserFollower.where(userId: params[:id]).pluck(:followerId)
        uf.append(params[:id])
        posts = Post.where(user_id: uf).order(:created_at)
        render json: posts, include: :child_posts
    end
end
