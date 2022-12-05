class CreateUserFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_followers do |t|
      t.integer :userId
      t.integer :followerId

      t.timestamps
    end
  end
end
