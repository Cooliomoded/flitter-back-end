class StoryGenresController < ApplicationController
 
    before_action :authorized

    def create
        byebug
        storyGenre = StoryGenre.new(genre_id: params[:genre_id], story_id: params[:story_id])
        if storyGenre.save
            render json: {genre: StoryGenreSerializer.new(storyGenre)}
        else
            render json: {error: 'Genre could not be added to story'}
        end
    end

    def removeGenre
        byebug
        storyGenre = StoryGenre.find_by(story_id: params[:story_id, genre_id: params[:genre_id]])
    end

    def destroy
        byebug
        genre = StoryGenre.find(params[:id])
        genre.destroy
    end

end
