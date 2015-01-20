class AddAdminRoles < ActiveRecord::Migration
  def change
  	create_table :roles do |t|
      t.integer :user_id
      t.integer :account_id
      t.boolean :super_admin
      t.boolean :list_manager
      t.timestamps
    end
  end
end
