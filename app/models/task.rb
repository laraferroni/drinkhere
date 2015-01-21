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

def required_list_items
  self.master_list.master_list_items.where("task_id = ?", self.id).order("full_name ASC")
end

def required_list_ids
  self.master_list.master_list_items.where("task_id = ?", self.id).pluck(:id)
end

def optional_list_items
  self.master_list.master_list_items.where("task_id != ? OR task_id IS ?", self.id, nil).order("full_name ASC")
end

end
