class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id, null: false
      t.string :token, null: false
      t.string :device
      t.string :location

      t.timestamps
    end
    add_index :sessions, :user_id
    add_index :sessions, :token
  end
end
