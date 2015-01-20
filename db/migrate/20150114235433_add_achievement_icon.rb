class AddAchievementIcon < ActiveRecord::Migration
  def change
  	    add_column :achievements, :icon_src, :string
				add_column :achievements, :html_color, :string
  end
end
