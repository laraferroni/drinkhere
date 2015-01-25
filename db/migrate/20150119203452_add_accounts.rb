class AddAccounts < ActiveRecord::Migration
  def change

    create_table :settings do |t|
      t.integer :account_id
      t.string :url
      t.timestamps
    end

  	create_table :accounts do |t|
      t.string :name
      t.string :subdomain
      t.timestamps
    end
  	add_column :users, :account_id, :integer
		add_column :user_list_items, :account_id, :integer
		add_column :master_lists, :account_id, :integer
		add_column :master_list_items, :account_id, :integer
		add_column :achievements, :account_id, :integer
		add_column :tasks, :account_id, :integer
		add_column :item_types, :account_id, :integer
		add_column :locations, :account_id, :integer
    add_attachment :achievements, :homepageimage
    add_column :achievements, :prereq_id, :integer

  end
end
