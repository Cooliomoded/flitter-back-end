class GenreSerializer < ActiveModel::Serializer
  attributes :id, :genre
  has_many :stories
end
