class User < ApplicationRecord
    has_many :posts
    has_many :user_followers

    has_secure_password

    validates :name, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :handle, presence: true, uniqueness: true
    
    
    
    
    
    
end
