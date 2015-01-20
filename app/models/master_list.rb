class MasterList < ActiveRecord::Base
	acts_as_tenant(:account)
	
	belongs_to :account	
	belongs_to :location
	has_many :master_list_items

	rails_admin do 
    list do
      field :name
      field :location
    end
    edit do
    	field :name
      field :location
      field :show_price
      field :master_list_items
    end
  end


end

