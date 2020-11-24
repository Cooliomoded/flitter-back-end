class CommentsController < ApplicationController

    before_action :authorized, only: [:create, :destroy]

    def index
        comments = Comment.all
        render json: comments
    end

    def show
        comment = Comment.find(params[:comment_id])
        render json: comment
    end
    
    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: {error: 'Your comment could not be posted.'}
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        if comment
            comment.destroy
        else
            render json: {error: 'Comment could not be found'}
        end
    end

end
