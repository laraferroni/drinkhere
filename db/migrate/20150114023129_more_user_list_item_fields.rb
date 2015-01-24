class MoreUserListItemFields < ActiveRecord::Migration
  def change
		add_column :user_list_items, :rating, :integer
		add_column :master_list_items, :full_name, :string
		
  end
end
