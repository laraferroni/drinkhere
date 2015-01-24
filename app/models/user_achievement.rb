class UserAchievement < ActiveRecord::Base
  acts_as_tenant(:account)
  belongs_to :user
  belongs_to :account
  belongs_to :achievement

	rails_admin do 
    list do
    	field :account
    	field :user
      field :achievement

    end
    edit do
    	field :user
      field :achievement
      field :completed
    end
  end




  
end