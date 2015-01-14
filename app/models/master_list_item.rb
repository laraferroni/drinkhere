class MasterListItem < ActiveRecord::Base

	belongs_to :brand
	belongs_to :origin
	has_many :user_list_items
	has_many :users, through: :user_list_items
end
