class TrimName < ActiveRecord::Migration
  def up
  	MasterListItem.all.each do |item|
  		if item.name.present?
	  		item.name = item.name.strip
  			item.save
    	end
    end
  end
end
