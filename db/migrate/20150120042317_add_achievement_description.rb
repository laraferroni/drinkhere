class AddAchievementDescription < ActiveRecord::Migration
  def change
  	add_column :achievements, :description, :text
  	add_column :achievements, :rules, :text
    add_column :achievements, :reward, :text
  end
end
