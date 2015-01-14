class CreateMasterLists < ActiveRecord::Migration
  def change
    create_table :master_lists do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
