class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :handle
      t.string :password
      t.has_many :posts
      t.timestamps
    end
  end
end
