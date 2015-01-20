class AddListIdToMlItems < ActiveRecord::Migration
  def change
  	add_column :master_list_items, :master_list_id, :integer
  end
end
