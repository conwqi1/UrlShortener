class UpdateUsers < ActiveRecord::Migration
  def changerequire "20140820212915_create_users"
      add_index :users, :email, unique: true
  end
end
