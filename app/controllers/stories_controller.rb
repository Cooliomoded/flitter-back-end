class StoriesController < ApplicationController

    skip_before_action :authorized, only: [:index, :show]


    def index
        stories = Story.all
        render json: stories
    end

    def show
        story = Story.find(params[:id])
        render json: {story: StorySerializer.new(story)}
    end

    def create
        story = Story.new(user_id: logged_in_user.id, title: params[:title], content: params[:content], reads: params[:reads], likes: params[:likes])
            if story.save
                render json: {story: StorySerializer.new(story)}
            else 
                render json: {error: 'You are not authorized to author a story.'}
            end
    end
end
