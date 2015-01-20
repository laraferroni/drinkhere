class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :name
      t.timestamps
    end

    create_table :tasks do |t|
      t.integer :achievement_id
      t.string :name
      t.integer :master_list_id
      t.integer :total_items_needed
      t.timestamps
    end

    create_table :item_types do |t|
      t.string :name
      t.timestamps
    end

    add_column :master_list_items, :item_type_id, :integer
    add_column :master_list_items, :date_added, :date
    add_column :master_list_items, :task_id, :boolean
    add_column :master_list_items, :out_of_stock, :boolean
    add_column :master_list_items, :no_longer_produced, :boolean
    add_column :master_list_items, :rare, :boolean
    add_column :master_list_items, :new, :boolean
    add_column :master_list_items, :free_to_sample, :boolean
    add_column :master_list_items, :proof, :decimal, {:precision=>5, :scale=>2}

  end
end


