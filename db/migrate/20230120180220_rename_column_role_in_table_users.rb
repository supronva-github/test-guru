class RenameColumnRoleInTableUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :role, :type
    User.update_all(type: 'User')
    User.find_each do |user|
      user.confirm
      user.save
    end
    change_column_default(:users, :type, from: nil, to: 'User')
    change_column_null(:users, :type, false)
  end
end
