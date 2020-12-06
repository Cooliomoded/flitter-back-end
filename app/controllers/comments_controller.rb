class CommentsController < ApplicationController

    before_action :authorized, only: [:create, :destroy]

    def index
        comments = Comment.all
        render json: comments
    end

    def show
        comment = Comment.find(params[:comment_id])
        render json: {comment: CommentSerializer.new(comment)}, status: :accepted
    end
    
    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: {comment: CommentSerializer.new(comment)}, status: :accepted
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

    private

    def comment_params 
        params.require(:comment).permit(:user_id, :content, :story_id)
    end
end
