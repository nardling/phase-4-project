class PostsController < ApplicationController

    def getLatest
        uf = UserFollower.where(user_id: params[:id]).pluck(:followerId)
        uf.append(params[:id])
        # posts = Post.joins("INNER JOIN users on users.id = posts.user_id").where(user_id: uf).select('posts.*, users.handle').order(:created_at)
        posts = Post.where(user_id: uf).order(:created_at)
        render json: posts, include: :child_posts, include: :user
    end

    # def show
    #     uf = UserFollower.where(user_id: params[:id])   #.pluck(:followerId)
    #     puts "followers"
    #     puts uf
    #     puts "end followers"
    #     uf.append(params[:id])
    #     posts = Post.where(user_id: uf).order(:created_at)
    #     render json: posts, include: :child_posts
    # end

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
