class PostsController < ApplicationController

    def getLatest
        uf = UserFollower.where(user_id: params[:id]).pluck(:followerId)
        uf.append(params[:id])
        posts = Post.where(user_id: uf).order(:created_at)
        render json: posts, include: :child_posts
    end

    def show
    posts = Post.where(user_id: params[:id])
    render json: posts, status: :ok
    
    end

    def createNew
        Post.create!(new_post_params)
        render json: {}, status: :ok
    end

    def createComment
        Post.create!(comment_params)
        render json: {}, status: :ok
    end

    private
    def new_post_params
        params.require(:post).permit(:user_id, :text, :commentPermissions).with_defaults(parentPostId: 0, rootPostId: 0)
    end
    
    def comment_params
        params.require(:post).permit(:user_id, :text, :commentPermissions, :parentPostId, :rootPostId)
    end
end
