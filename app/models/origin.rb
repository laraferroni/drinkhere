class Origin < ActiveRecord::Base
	#acts_as_mappable auto_geocode: true

	has_many :master_list_items
end