class RemoveSessionTokenFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :session_token
  end

  def down
    add_column :users, :session_token, :string
  end
end
