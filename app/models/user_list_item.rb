class UserListItem < ActiveRecord::Base
  acts_as_tenant(:account)
  
  belongs_to :account
	belongs_to :master_list_item
	belongs_to :user
  belongs_to :master_list
  belongs_to :approved_by, class_name: "User", foreign_key: 'approved_by_id'


	rails_admin do 
    list do
    	field :user_name
      field :master_list
      field :master_list_item_name
      field :rating
      field :completed
      field :date_completed
      
      field :tasting_notes
      field :created_at
    end
    edit do
      field :user
      field :master_list
      field :master_list_item
      field :rating
      field :completed
      field :date_completed
      field :approval_status
      field :approved_by
    end
  end

  PERMITTED_ATTRS = [
    :master_list_id,
    :master_list_item_id,
    :id,
    :approval_status,
    :approved_by_id

    ]


  def user_name
    if self.user.present?
      self.user.full_name
    end
  end

  def master_list_item_name
    if self.master_list_item.present?
      self.master_list_item.full_name 
    end
  end


  before_save :set_master_list_id
  after_save :set_user_achievement_status

  def set_master_list_id
    if self.master_list_item.present?
      self.master_list_id = self.master_list_item.master_list_id
    end
  end

  def set_user_achievement_status
    
  end


end
