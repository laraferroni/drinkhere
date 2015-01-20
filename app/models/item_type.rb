class ItemType < ActiveRecord::Base
	acts_as_tenant(:account)
	belongs_to :account


	rails_admin do 
    list do
    	field :account
    	field :name
    end
    edit do
    	field :name
    end
  end

  
end
