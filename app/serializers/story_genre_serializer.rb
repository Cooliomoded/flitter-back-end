class StoryGenreSerializer < ActiveModel::Serializer
  attributes :id
  has_one :story
  has_one :genre
end
