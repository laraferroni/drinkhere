class AddTasterRole < ActiveRecord::Migration
  def change

  	create_table :user_achievements do |t|
      t.integer :account_id
      t.integer :user_id
      t.integer :achievement_id
      t.timestamps
    end

  end


end
