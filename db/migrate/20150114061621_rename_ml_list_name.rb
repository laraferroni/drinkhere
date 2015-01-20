class RenameMlListName < ActiveRecord::Migration
  def change
  	rename_column :master_lists, :listname, :name
  end
end
