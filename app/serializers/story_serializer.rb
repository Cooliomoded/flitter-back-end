class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :content, :reads, :likes
  has_one :user
  has_many :comments
  has_many :genres
end
