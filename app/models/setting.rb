class Setting < ActiveRecord::Base
	acts_as_tenant(:account)


  has_attached_file :logo, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_url("/assets/:style/drinkhere.png")
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  belongs_to :account


  	rails_admin do 
	    list do
	    	field :account
	      field :url
	    end
	    edit do
	    	field :url
	    	field :logo
	    end

  	end


end