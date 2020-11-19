class Story < ApplicationRecord
    has_many :comments
    has_many :story_genres
    has_many :genres, through: :story_genres

    validates :content, length: { in: 5..10000 }
    validates :title, presence: true
end
