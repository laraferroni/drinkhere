class Account < ActiveRecord::Base
  has_one :setting
  

  after_save :create_settings

  def create_settings
  	logger.debug("create settings")
  	logger.debug(self.id)
  	s = Setting.where(account_id: self.id).first
  	if s.nil?
  		s = Setting.new
	  	s.account_id = self.id
  		s.save

  		u = User.new
	  	a_name = self.name
	  	if a_name.present?
	  		a_name = a_name.gsub(/\s+/, "")
	  		a_name = "admin@"+a_name.downcase + ".com"
	  	else
	  		a_name = "admin@drinkhere.com"
	  	end
	  	u.email = a_name
	  	u.password = "changeme"
	  	u.password_confirmation = "changeme"
	  	u.save!

	  	r = Role.new
	  	r.user_id = u.id
	  	r.account_id = self.id
	  	r.list_manager = true
	  	r.super_admin = true
	  	r.save
	  end
  end

  	

end