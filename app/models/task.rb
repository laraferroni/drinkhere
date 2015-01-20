class Task < ActiveRecord::Base
	acts_as_tenant(:account)

	belongs_to :account	
	belongs_to :achievement
	belongs_to :master_list



	rails_admin do 
    list do
      field :name
      field :achievement
      field :master_list
    end
    edit do
    	field :name
      field :achievement
      field :master_list
      field :total_items_needed
      field :number_of_days
    end
  end
end
