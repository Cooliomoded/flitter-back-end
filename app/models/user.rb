class User < ApplicationRecord
    has_secure_password

    has_many :stories
    has_many :comments

    # validates :username, uniqueness: true
    # validates :password, length: { minimum: 3}
    # validates :bio, length: { in: 6..500 }
end
