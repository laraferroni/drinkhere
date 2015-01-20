class Achievement < ActiveRecord::Base
  has_attached_file :icon, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_url("/assets/:style/missing.png")
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/
	acts_as_tenant(:account)

	belongs_to :account
	has_many :tasks
	belongs_to :location


	rails_admin do 
    list do
      field :name
    end
    edit do
    	field :name
      field :description
      field :rules
      field :reward
      field :icon
    end
  end
	
end
