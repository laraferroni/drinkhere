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

require "open-uri"

def AddListItem(rh, list)
	if !rh['brand'].blank?
		brand = rh['brand'].strip
		if brand != ""
			brand = brand.html_safe
			b = Brand.where(name: brand).first_or_create
			if rh['url'].present?
				if rh['url'].strip != "NULL" 
					b.url = rh['url'].strip
				end
			end
			b.save
		end
  end


  fn = []
  if b.present?
    fn << b.name
  end
  fn << rh['name']
	full_name = fn.compact.join(" ")

  puts "Creating List Item: #{full_name}"
  n= MasterListItem.where(full_name: full_name).first_or_create


	if rh['origin'].present?
		origin = rh['origin'].strip
		if origin != ""
			o = Origin.where(name: origin).first_or_create
			o.address = origin
			o.save
		end
	end

	if rh['item_type'].present?
		item_type = rh['item_type'].strip
		if item_type != "NULL"
			it = ItemType.where(name: item_type).first_or_create
			it.save
		end
	end

	if rh["creator"].present?
		c_string = rh["creator"].strip
		puts "'"+c_string+"'"
		cr = Creator.where(name: c_string).first_or_create
		puts cr.name
		cr.save
	end

  
  if rh['name'].present?
	  n.name = rh['name'].strip
	end

  if b.present?
  	n.brand_id = b.id
  end

  if o.present?
  	n.origin_id = o.id
  end

  if rh['city'].present?
	  n.city = rh['city'].strip
	end
	
	if cr.present?
  	n.creator_id = cr.id
  end


  n.available = true

  if rh['date_added'].present? && rh['date_added'] != "-"
	  n.date_added = Date.strptime(rh['date_added'].strip, '%m/%d/%Y')
	else
		n.date_added = Time.now
  end


  if rh['price'].present?
	  n.price = rh['price'].strip
  end

  if rh['proof'].present?
	  n.proof = rh['proof'].strip.to_f
	end

	if rh['strength'].present?
	  n.strength = rh['strength'].strip
	end

  n.out_of_stock = (rh['out_of_stock'].downcase == "true") if rh['out_of_stock'].present?
  n.no_longer_produced = (rh['no_longer_produced'].downcase == "true") if rh['no_longer_produced'].present?
  n.free_to_sample = (rh['free_to_sample'].downcase == "true") if rh['free_to_sample'].present?
  n.rare = (rh['rare'].downcase == "true") if rh['rare'].present?

  n.limited_quantities = (rh['limited_quantities'].downcase == "y") if rh['limited_quantities'].present?

  if rh['notes'] != "NULL" && rh['notes'].present?
  	n.notes = rh['']
  end

	if rh['description'] != "NULL" && rh['description'].present?
  	n.description = rh['description']
  end

  n.master_list_id = list.id
  n.new = false

 
  if rh['photo'].present?
  	url = "https://s3-us-west-2.amazonaws.com/drinkhereseeds/images/"+rh['photo'].strip
  	n.photo = URI.parse(url)
  end

	n.save

  return n
end


if true
	CSV.foreach(Rails.root + 'db/seeds/locations.csv', :headers => true) do |row|
		rh = row.to_hash
		name = rh["Name"]
		puts "Creating Location: #{name}"
		n= Origin.where(name: name).first_or_create
		n.address = rh["Address"]
		n.lat = rh["Lat"]
		n.lng = rh["Lng"]
		n.save
	end
end


a = Account.where(name: "Hale Pele").first_or_create
a.subdomain = "halepele"
a.save


a_name = a.subdomain
if a_name.present?
	a_name = a_name.gsub(/\s+/, "")
	a_name = "admin@"+a_name.downcase + ".com"
else
	a_name = "admin@drinkhere.com"
end

u = User.where(email: a_name).first_or_create

u.email = a_name
u.password = "changeme"
u.password_confirmation = "changeme"
u.save!

r = Role.where("user_id = ? AND account_id = ?", u.id, a.id)
r.user_id = u.id
r.account_id = a.id
r.list_manager = true
r.super_admin = true
r.save

ActsAsTenant.current_tenant = a

CSV.foreach(Rails.root + 'db/seeds/rums.csv', :headers => true) do |row|

	rh = row.to_hash
	list = MasterList.where(name: "Fire Drinkers").first_or_create
	list.save
	
	master = Achievement.where(name: "Master Fire Drinker").first_or_create
	master.save
	grandmaster = Achievement.where(name: "Grand Master Fire Drinker").first_or_create
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

  item = AddListItem(rh, list)
  puts item.full_name
	
	if rh['level'].present?
		level = rh['level'].strip
	  if level!= "NULL"  	
	  	if level == 50
	  		item.task_id = l50.id
	  	end
	  	if level == 100
	  		item.task_id = l100.id
	  	end
	  	if level == 200
	  		item.task_id = l200.id
	  	end
	  	if level == 300
	  		item.task_id = l300.id
	  	end  	  	
	  end
	  item.save
	end

end

#hale pele cocktails
CSV.foreach(Rails.root + 'db/seeds/cocktails.csv', :headers => true) do |row|
	rh = row.to_hash

	list = MasterList.where(name: "Cocktails").first_or_create
	list.save
	
	master = Achievement.where(name: "Water Bearers").first_or_create
	master.save
	
	wb = Task.where(name: "Water Bearers").first_or_create
	wb.achievement_id = master.id
	wb.master_list_id = list.id
	wb.total_items_needed = 50
	wb.save

	item = AddListItem(rh, list)
	puts item.full_name
	item.task_id = wb.id
	item.save

end

#pope house seeds
a = Account.where(name: "Pope House").first_or_create
a.subdomain = "popehouse"
a.save

a_name = a.subdomain
if a_name.present?
	a_name = a_name.gsub(/\s+/, "")
	a_name = "admin@"+a_name.downcase + ".com"
else
	a_name = "admin@drinkhere.com"
end

u = User.where(email: a_name).first_or_create

u.email = a_name
u.password = "changeme"
u.password_confirmation = "changeme"
u.save!

r = Role.where("user_id = ? AND account_id = ?", u.id, a.id)
r.user_id = u.id
r.account_id = a.id
r.list_manager = true
r.super_admin = true
r.save

ActsAsTenant.current_tenant = a


CSV.foreach(Rails.root + 'db/seeds/ph_bourbon.csv', :headers => true) do |row|

  rh = row.to_hash

	list = MasterList.where(name: "Bourbons").first_or_create
	list.save
	
	master = Achievement.where(name: "Bourbon Derby").first_or_create
	master.save

	bourbons = Task.where(name: "Bourbon Derby").first_or_create
	bourbons.achievement_id = master.id
	bourbons.master_list_id = list.id
	bourbons.total_items_needed = 50
	bourbons.save
	
	item = AddListItem(rh, list)
	puts item.full_name

end



