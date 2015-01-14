class AddBrandTable < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :normalized_name
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
