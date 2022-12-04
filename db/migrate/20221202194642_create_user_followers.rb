class CreateUserFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_followers do |t|
      t.string :userId
      t.string :followerId

      t.timestamps
    end
  end
end
