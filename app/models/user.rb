class User < ApplicationRecord
    has_many :posts
    has_many :user_followers

    has_secure_password
end
