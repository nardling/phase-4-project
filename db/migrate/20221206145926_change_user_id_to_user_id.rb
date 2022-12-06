class ChangeUserIdToUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :user_followers, :userId, :user_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
