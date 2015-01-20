class Role < ActiveRecord::Base
  acts_as_tenant(:account)
  belongs_to :user
  belongs_to :account

	rails_admin do 
    list do
    	field :account
    	field :user
      field :super_admin
      field :list_manager
    end
    edit do
    	field :user
      field :super_admin
      field :list_manager
    end
  end
end