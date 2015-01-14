class AddOriginsTable < ActiveRecord::Migration
  def change
    create_table :origins do |t|
      t.string :name
      t.string :normalized_name
      t.string :address
      t.text :description
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :lng, {:precision=>10, :scale=>6}
      t.timestamps
    end
  end
end
