class RecastType < ActiveRecord::Migration
  def change
  	change_column :master_list_items, :task_id, :integer
  end
end
