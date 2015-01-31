class AddLimitedQuatities < ActiveRecord::Migration
  def change
  	add_column :master_list_items, :limited_quantities, :boolean
  end
end
