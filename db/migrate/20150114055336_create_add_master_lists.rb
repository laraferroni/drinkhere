class CreateAddMasterLists < ActiveRecord::Migration
  def change
    create_table :master_lists do |t|
    		t.string :listname
    		t.string :itemname_label
    		t.string :origin_label
    		t.integer :company_id
    		t.boolean :show_price
      t.timestamps
    end
  end

end
