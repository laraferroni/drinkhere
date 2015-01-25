# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
# Load the initial geo-coded notification areas.
#


CSV.foreach(Rails.root + 'db/seeds/locations.csv') do |row|
	name = row[0]
	puts "Creating Location: #{name}"
	n= Origin.where(name: name).first_or_create
	n.address = name
	n.save
end


a = Account.where(name: "Bar Name").first_or_create
a.save

ActsAsTenant.current_tenant = a

CSV.foreach(Rails.root + 'db/seeds/rums.csv') do |row|
	puts row[2]

	list = MasterList.where(name: "Fire Drinkers").first_or_create
	list.save
	
	master = Achievement.where(name: "Master").first_or_create
	master.save
	grandmaster = Achievement.where(name: "Grand Master").first_or_create
	grandmaster.save
	ambassador = Achievement.where(name: "Ambassador").first_or_create
	ambassador.save
	chief = Achievement.where(name: "High Chief").first_or_create
	chief.save

	l50 = Task.where(name: "Master").first_or_create
	l50.achievement_id = master.id
	l50.master_list_id = list.id
	l50.total_items_needed = 50
	l50.save
	
	l100 = Task.where(name: "Grand Master").first_or_create
	l100.achievement_id = grandmaster.id
	l100.master_list_id = list.id
	l100.total_items_needed = 100	
	l100.save

	l200 = Task.where(name: "Ambassador").first_or_create
	l200.achievement_id = ambassador.id
	l200.master_list_id = list.id
	l200.total_items_needed = 200
	l200.save
	
	l300 = Task.where(name: "High Chief").first_or_create
	l300.achievement_id = chief.id
	l300.master_list_id = list.id
	l300.total_items_needed = 300	
	l300.save

	brand = row[1].strip
	if brand != ""
		brand = brand.html_safe
		b = Brand.where(name: brand).first_or_create
		if row[17].present?
			if row[17].strip != "NULL" 
				b.url = row[17].strip
			end
		end
		b.save
	end

	origin = row[7].strip
	if origin != ""
		o = Origin.where(name: origin).first_or_create
		o.address = origin
		o.save
	end

	item_type = row[5].strip
	if item_type != "NULL"
		it = ItemType.where(name: item_type).first_or_create
		it.save
	end

  fn = []
  if b.present?
    fn << b.name
  end
  fn << row[2]
	full_name = fn.compact.join(" ")

  puts "Creating Rum: #{full_name}"
  n= MasterListItem.where(full_name: full_name).first_or_create
  
  if row[2].present?
	  n.name = row[2].strip
	end

  if b.present?
  	n.brand_id = b.id
  end

  if o.present?
  	n.origin_id = o.id
  end
	
	level = row[3].strip
  if level!= "NULL"  	
  	if level == 50
  		n.task_id = l50.id
  	end
  	if level == 100
  		n.task_id = l100.id
  	end
  	if level == 200
  		n.task_id = l200.id
  	end
  	if level == 300
  		n.task_id = l300.id
  	end  	  	
  end

  n.available = true

  if row[9].present?
	  n.date_added = row[9].strip.to_date
  end
  n.price = row[4].strip
  
  n.proof = row[6].strip.to_f

  n.out_of_stock = (row[10] != "n" )
  n.no_longer_produced = (row[11] != "n" )
  n.free_to_sample = (row[12] != "n")
  n.rare = (row[13] != "n")
  n.notes = row[15]
  n.master_list_id = 1
  n.new = false

  n.save

end