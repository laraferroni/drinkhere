class Achievement < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  has_attached_file :homepageimage, :styles => {:large => "1200x1200", :medium => "500x500>", :thumb => "100x100>" }, :default_url => "https://s3-us-west-2.amazonaws.com/drinkhereassets/images/missing_homepage_image.jpg"
  has_attached_file :icon, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "https://s3-us-west-2.amazonaws.com/drinkhereassets/images/missing.png"
  validates_attachment_content_type :homepageimage, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/
	acts_as_tenant(:account)

	belongs_to :account
	has_many :tasks
  has_many :user_achievements
	belongs_to :location
  belongs_to :prereq, class_name: "Achievement", foreign_key: 'prereq_id'
  

	rails_admin do 
    list do
      field :account
      field :name
      field :prereq
      field :description
    end
    edit do
    	field :name
      field :description
      field :prereq
      field :rules
      field :reward
      field :homepageimage
      field :icon
    end
  end
	
end
