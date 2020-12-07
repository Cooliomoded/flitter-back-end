class StoryGenresController < ApplicationController
 
    before_action :authorized

    def index
        genres = StoryGenre.all
    end

    def show
        genre = StoryGenre.find(params[:id])
    end

    def create
        storyGenre = StoryGenre.new(genre_params)
        if storyGenre.save
            render json: {genre: StoryGenreSerializer.new(storyGenre)}
        else
            render json: {error: 'Genre could not be added to story'}
        end
    end

    def removeGenre
        storyGenre = StoryGenre.where(story_id: genre_params[:story_id], genre_id: genre_params[:genre_id])
        storyGenre.first.destroy
    end

    def genre_params 
        params.require(:genre).permit(:story_id, :genre_id)
    end

end
