class RenameCompanies < ActiveRecord::Migration
  def up
  	 rename_table :companies, :locations
  	 rename_column :achievements, :company_id, :location_id
  	 rename_column :master_lists, :company_id, :location_id
  	 
  end

  def down
  		rename_table :companies, :locations
  		rename_column :achievements, :location_id, :company_id
  	  rename_column :master_lists, :location_id, :company_id
  end
end
