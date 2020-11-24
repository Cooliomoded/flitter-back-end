class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :reads, :likes, :user_id
  has_one :user
  has_many :comments
  has_many :genres
end
