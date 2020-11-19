class Genre < ApplicationRecord
    has_many :story_genres
    has_many :stories, through: :story_genres
end
