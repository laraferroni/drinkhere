class AddMasterItemPhoto < ActiveRecord::Migration
  def self.up
    add_attachment :master_list_items, :photo
  end

  def self.down
    remove_attachment :master_list_items, :photo
  end
end
