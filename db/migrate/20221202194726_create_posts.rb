class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :authorId
      t.string :parentPostId
      t.string :rootPostId
      t.string :commentPermissions
      t.string :text
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
