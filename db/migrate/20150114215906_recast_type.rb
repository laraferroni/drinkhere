class RecastType < ActiveRecord::Migration
  def change
  	change_column :master_list_items, :task_id, 'integer USING CAST("task_id" AS integer)'
  end
end
