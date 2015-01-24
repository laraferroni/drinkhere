class AddSettings < ActiveRecord::Migration
  def change
  	create_table :settings do |t|
      t.integer :account_id
      t.string :url
      t.timestamps
    end

    add_attachment :achievements, :homepageimage
    add_column :achievements, :prereq_id, :integer

  end
end
