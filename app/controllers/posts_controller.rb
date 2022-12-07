class PostsController < ApplicationController

    def getLatest
        uf = UserFollower.where(user_id: params[:id]).pluck(:followerId)
        uf.append(params[:id])
        posts = Post.where(user_id: uf, parentPostId: 0).order(:created_at)
        render json: posts, include: [:child_posts, :user]
    end

    def showDetail
        posts = Post.where(id: params[:id]).order(:created_at)
        render json: posts, include: [:child_posts, :user]
    end

    def getComments
        posts = Post.where(parentPostId: params[:id]).order(:created_at)
        render json: posts, include: [:child_posts, :user]
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
        post = Post.create!(new_post_params)
        render json: post, status: :ok, include: [:child_posts, :user]
    end

    def createComment
        post = Post.create!(comment_params)
        render json: post, status: :ok, include: [:child_posts, :user]
    end

    def destroy
    post = Post.find(params[:id])
    post.destroy 
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
