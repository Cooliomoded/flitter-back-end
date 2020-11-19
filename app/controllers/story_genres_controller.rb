class StoryGenresController < ApplicationController

    def show

    end
    
    def create
        genre = StoryGenre.new(user_id: params[:user_id], story_id: params[:story_id])
        if genre.save
            render json: {genre: StoryGenreSerializer.new(genre)}
        else
            render json: {error: 'Genre could not be added to story'}
        end
    end

    def destroy
        genre = StoryGenre.find(params[:id])
        genre.destroy
    end

end
