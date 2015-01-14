class RenameMasterList < ActiveRecord::Migration
  def up
  	 rename_table :master_lists, :master_list_items
  end

  def down
  		rename_table :master_list_items, :master_lists
  end
end
