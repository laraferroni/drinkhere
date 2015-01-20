class AddIconToAchievement < ActiveRecord::Migration
  def self.up
    add_attachment :achievements, :icon
  end

  def self.down
    remove_attachment :achievements, :icon
  end
end
