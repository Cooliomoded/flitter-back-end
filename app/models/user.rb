class User < ApplicationRecord
    has_secure_password

    has_many :stories
    has_many :comments

    validates :username, uniqueness: true
    validates :penname, uniqueness: true
    validates :password, length: { minimum: 4}
    validates :bio, length: { in: 6..500 }
    validates :email, inclusion: { in: %w(@ .com), message: "Is not a valid e-mail address"}
end
