class UserSerializer < ActiveModel::Serializer
  attributes :username, :penname, :email, :picture, :bio
  has_many :comments
  has_many :stories
end
