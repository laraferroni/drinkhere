class MasterListItem < ActiveRecord::Base
  acts_as_tenant(:account)
  has_attached_file :photo, :styles => { :medium => "500x500>",:small => "250x250", :square => "250x250#", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_url("/:style/missing.png")
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  belongs_to :master_list
	belongs_to :brand
	belongs_to :origin
  belongs_to :item_type
  belongs_to :task
	has_many :user_list_items
	has_many :users, through: :user_list_items
  belongs_to :creator

  scope :available, -> {
    where('available = ?', true)
  }


	rails_admin do 
    list do
      field :master_list
    	field :task
      field :brand
      field :full_name
      field :origin
      field :price
      field :limited_quantities      
      field :notes
    end
    edit do
      field :master_list
      field :task
      field :brand
      field :name
      field :photo
      field :available
      field :rare
      field :limited_quantities
      field :out_of_stock
      field :origin
      field :city
      field :creator
      field :price
      field :proof
      field :strength

      field :description
      field :notes

    end
  end



  before_save :set_fullname

  def set_fullname
  	fn = []
    if self.brand.present?
      fn << self.brand.name
    end
    fn << self.try(:name)
  	self.full_name = fn.compact.join(" ")
  end


end
