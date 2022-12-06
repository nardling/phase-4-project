class Post < ApplicationRecord
    belongs_to :user
    has_many :child_posts, :class_name => "Post", :foreign_key => "rootPostId"
end
