class Brand < ActiveRecord::Base
	has_many :master_list_items

	rails_admin do 
    list do
    	field :name
    	field :url
    end
    edit do
    	field :name
    	field :url
    end
  end

end