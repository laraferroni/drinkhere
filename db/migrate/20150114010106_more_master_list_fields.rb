class MoreMasterListFields < ActiveRecord::Migration
  def change
  	add_column :master_lists, :available, :boolean
  	add_column :master_lists, :rating, :integer
  	add_column :master_lists, :notes, :text
  	add_column :master_lists, :price, :string
  	add_column :master_lists, :origin_id, :integer
  	add_column :master_lists, :brand_id, :integer
  	
  	add_column :master_lists, :custom1, :string
  	add_column :master_lists, :custom2, :string
  	add_column :master_lists, :custom3, :string
  	add_column :master_lists, :custom4, :string
  	add_column :master_lists, :custom5, :string  	
  end
end
