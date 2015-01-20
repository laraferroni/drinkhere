class AddTimePeriodToTask < ActiveRecord::Migration
  def change
  	add_column :tasks, :number_of_days, :integer
  end
end
