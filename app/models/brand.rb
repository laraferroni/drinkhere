class Brand < ActiveRecord::Base
	has_many :master_list_items
end