class StoriesController < ApplicationController

    before_action :authorized, only[:create]


    def index
        stories = Story.all
        render json: stories
    end

    def show
        story = Story.find(params[:id])
        render json: {story: StorySerializer.new(story)}
    end

    def create
        story = Story.new(user_id: logged_in_user.id, story_id: params[:story_id])
            if story.save
                render json: {user: UserSerializer.new(user)}
            else 
                render json: {error: 'You are not authorized to author a story.'}
            end
    end
end
