class Post < ApplicationRecord
    belongs_to :user
    belongs_to :parent, :class_name => "Post", :foreign_key => "parentPostId"
    has_many :child_posts, :class_name => "Post", :foreign_key => "rootPostId"
end
