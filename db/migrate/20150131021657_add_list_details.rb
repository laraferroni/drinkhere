class AddListDetails < ActiveRecord::Migration
  def change


  	create_table :creators do |t|
      t.integer :account_id
      t.string :name
      t.timestamps
    end

  	add_column :master_list_items, :creator_id, :integer
  	add_column :master_list_items, :strength, :string
  	add_column :master_list_items, :city, :string

  end
end
