class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :story_id
  has_one :user
  has_one :story
end
