class AddAchievementCompletedCache < ActiveRecord::Migration
  def change
  	add_column :user_achievements, :completed, :boolean, default: false
  end
end
