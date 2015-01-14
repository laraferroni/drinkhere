class UserListItem < ActiveRecord::Base
	belongs_to :master_list_item
	belongs_to :user
end
