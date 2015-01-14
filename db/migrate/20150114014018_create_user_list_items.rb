class CreateUserListItems < ActiveRecord::Migration
  def change
    create_table :user_list_items do |t|
    	t.integer :user_id
      t.integer :master_list_item_id
      t.boolean :completed, default: false
      t.date :date_completed
      t.integer :approved_by_id
      t.text :tasting_notes
      t.timestamps
    end
  end
end
