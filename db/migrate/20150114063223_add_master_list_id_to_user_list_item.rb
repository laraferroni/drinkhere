class AddMasterListIdToUserListItem < ActiveRecord::Migration
  def change
  	add_column :user_list_items, :master_list_id, :integer
  end
end
