class AddGroupMemberCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :group_members_count, :integer
  end
end
